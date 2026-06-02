import 'package:flutter/material.dart';
import '../../data/datasources/sqlite_helper.dart';
import '../../data/models/profile_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _aboutMeController = TextEditingController();
  final _workExperienceController = TextEditingController();
  final _educationController = TextEditingController();
  final _skillController = TextEditingController();
  final _languageController = TextEditingController();

  Profile? _currentProfile;

  // Jobspot App Colors
  final Color primaryColor = const Color(0xFF130160);
  final Color secondaryColor = const Color(0xFFFF9228);

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final profile = await SQLiteHelper.instance.getProfile();
    if (profile != null) {
      setState(() {
        _currentProfile = profile;
        _nameController.text = profile.name;
        _emailController.text = profile.email;
        _phoneController.text = profile.phone;
        _aboutMeController.text = profile.aboutMe;
        _workExperienceController.text = profile.workExperience;
        _educationController.text = profile.education;
        _skillController.text = profile.skill;
        _languageController.text = profile.language;
      });
    }
  }

  Future<void> _updateProfileData() async {
    if (_formKey.currentState!.validate()) {
      final updatedProfile = Profile(
        id: _currentProfile?.id,
        name: _nameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        aboutMe: _aboutMeController.text,
        workExperience: _workExperienceController.text,
        education: _educationController.text,
        skill: _skillController.text,
        language: _languageController.text,
      );

      try {
        if (_currentProfile == null) {
          await SQLiteHelper.instance.insertProfile(updatedProfile);
        } else {
          await SQLiteHelper.instance.updateProfile(updatedProfile);
        }

        await _loadProfile();

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Cập nhật thành công!'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Lỗi cập nhật: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  void _showEditBottomSheet(String title, TextEditingController controller) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Edit $title',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controller,
                maxLines: 4,
                minLines: 1,
                decoration: InputDecoration(
                  hintText: 'Enter your $title',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {}); // Update UI
                  Navigator.pop(context); // Close BottomSheet
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50), 
                  backgroundColor: primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 15)
                ),
                child: const Text('Save', style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSection(String title, String content, TextEditingController controller) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Colors.grey.withOpacity(0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit, size: 20, color: Colors.blue),
                  onPressed: () => _showEditBottomSheet(title, controller),
                  constraints: const BoxConstraints(),
                  padding: EdgeInsets.zero,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              content.isEmpty ? 'Chưa cập nhật' : content,
              style: TextStyle(
                color: content.isEmpty ? Colors.grey : Colors.black87,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Jobspot Profile',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: primaryColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    _buildTextField(
                      controller: _nameController, 
                      label: 'Full Name', 
                      icon: Icons.person
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: _emailController, 
                      label: 'Email Address', 
                      icon: Icons.email, 
                      isEmail: true
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: _phoneController, 
                      label: 'Phone Number', 
                      icon: Icons.phone, 
                      isPhone: true
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _buildSection('About Me', _aboutMeController.text, _aboutMeController),
              _buildSection('Work Experience', _workExperienceController.text, _workExperienceController),
              _buildSection('Education', _educationController.text, _educationController),
              _buildSection('Skill', _skillController.text, _skillController),
              _buildSection('Language', _languageController.text, _languageController),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: _updateProfileData,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: secondaryColor,
                    minimumSize: const Size.fromHeight(56),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'UPDATE',
                    style: TextStyle(
                      fontSize: 16, 
                      fontWeight: FontWeight.bold, 
                      color: Colors.white
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool isEmail = false,
    bool isPhone = false,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: isEmail 
          ? TextInputType.emailAddress 
          : (isPhone ? TextInputType.phone : TextInputType.text),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey[600]),
        prefixIcon: Icon(icon, color: secondaryColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }
}
