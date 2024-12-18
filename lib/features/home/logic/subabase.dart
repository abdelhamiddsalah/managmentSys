/*import 'dart:io';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ImageFetchPage extends StatefulWidget {
  @override
  _ImageFetchPageState createState() => _ImageFetchPageState();
}

class _ImageFetchPageState extends State<ImageFetchPage> {
  List<String> _imageUrls = [];

  @override
  void initState() {
    super.initState();
    _fetchImages(); // جلب الصور عند تحميل الصفحة
  }

  // دالة لجلب الصور من Supabase وتصفية الصور الفارغة
  Future<void> _fetchImages() async {
    try {
      // جلب قائمة الصور من Supabase
      final response = await Supabase.instance.client.storage
          .from('foods_images') // اسم الـ Bucket الخاص بك
          .list();

      if (response.isEmpty) {
        print('No files found in the bucket.');
        return;
      }

      // تصفية الصور الفارغة أو التي تحتوي على placeholder
      final imageUrls = response.map((file) {
        final url = Supabase.instance.client.storage
            .from('foods_images')
            .getPublicUrl(file.name);

        // إذا كانت الصورة هي .emptyFolderPlaceholder أو الرابط فارغ، نقوم بتجاهلها
        if (url.contains('.emptyFolderPlaceholder') || url.isEmpty) {
          print('Skipping empty placeholder file: $url');
          return null; // نتجنب إرجاع رابط فارغ
        }
        return url;
      }).where((url) => url != null).toList();

      // تحديث الحالة بالقائمة المفلترة من الصور
      setState(() {
        _imageUrls = imageUrls.cast<String>();
      });

      print('Fetched images: $_imageUrls');
    } catch (e) {
      print('Error fetching images: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetched Images'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // لضبط العناصر في المنتصف
          children: [
            _imageUrls.isEmpty
                ? CircularProgressIndicator() // إظهار مؤشر التحميل إذا كانت الصور غير موجودة
                : Expanded(
                    child: ListView.builder(
                      itemCount: _imageUrls.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            _imageUrls[index],
                            width: 100,
                            height: 100,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return Center(child: CircularProgressIndicator());
                              }
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.error); // في حال حدوث خطأ أثناء تحميل الصورة
                            },
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}*/


/*import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mime/mime.dart';

class ImageUploadPage extends StatefulWidget {
  @override
  _ImageUploadPageState createState() => _ImageUploadPageState();
}

class _ImageUploadPageState extends State<ImageUploadPage> {
  File? _image;
  String? _uploadedImageUrl;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadImage() async {
    if (_image == null) return;

    final fileName = _image!.path.split('/').last;
    final fileMimeType = lookupMimeType(_image!.path);

    try {
      // رفع الصورة
      final filePath = await Supabase.instance.client.storage
          .from('foods_images') // استبدل بـ اسم الـ Bucket الخاص بك
          .upload(fileName, _image!, fileOptions: FileOptions(
            contentType: fileMimeType,
          ));

      // إنشاء رابط للصورة باستخدام fileName وليس filePath
      final publicUrl = Supabase.instance.client.storage
          .from('foods_images')
          .getPublicUrl(fileName);  // استخدم fileName فقط

      setState(() {
        _uploadedImageUrl = publicUrl;
      });

      print('Image uploaded successfully! URL: $publicUrl');
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image to Supabase'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image != null
                ? Image.file(_image!, width: 150, height: 150,)
                : Text('No image selected.'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Select Image'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadImage,
              child: Text('Upload Image'),
            ),
            SizedBox(height: 20),
            _uploadedImageUrl != null
                ? Column(
                    children: [
                      Text('Uploaded Image:'),
                      Image.network(_uploadedImageUrl!,width: 40,height: 40,),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}*/
//لبنىتلالنبرةلاىلللللللللللللللللللللللللللللللللللللللللللللللل

/*import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
final supabase = Supabase.instance.client;

Future<String> getImageUrl(String path) async {
  // استرجاع رابط الصورة من الباكت
  final publicUrl = supabase.storage
      .from('images') // استبدل باسم الباكت الخاص بك
      .getPublicUrl(path); // المسار داخل الباكت
  
  return publicUrl; // لا حاجة لاستخدام data هنا
}




class ImageDisplay extends StatelessWidget {
  final String imagePath;

  ImageDisplay({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getImageUrl(imagePath), // جلب الرابط
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // مؤشر التحميل
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}'); // رسالة الخطأ
        } else {
          return Image.network(
            snapshot.data!, // رابط الصورة
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return CircularProgressIndicator(); // مؤشر تحميل الصورة
            },
            errorBuilder: (context, error, stackTrace) {
              return Text('Failed to load image'); // عند فشل التحميل
            },
          );
        }
      },
    );
  }
}*/

/*import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';

final supabase = Supabase.instance.client;

Future<String> getImageUrl(String path) async {
  // استرجاع رابط الصورة من الباكت
  final publicUrl = supabase.storage
      .from('images') // استبدل باسم الباكت الخاص بك
      .getPublicUrl(path); // المسار داخل الباكت
  
  return publicUrl; // لا حاجة لاستخدام data هنا
}

class ImageDisplay extends StatelessWidget {
  final List<String> imagePaths;

  ImageDisplay({required this.imagePaths});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: imagePaths.length, // عدد الصور
      itemBuilder: (context, index) {
        return FutureBuilder<String>(
          future: getImageUrl(imagePaths[index]), // جلب الرابط لكل صورة
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // مؤشر التحميل
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}'); // رسالة الخطأ
            } else {
              return Image.network(
                snapshot.data!, // رابط الصورة
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return CircularProgressIndicator(); // مؤشر تحميل الصورة
                },
                errorBuilder: (context, error, stackTrace) {
                  return Text('Failed to load image'); // عند فشل التحميل
                },
              );
            }
          },
        );
      },
    );
  }
}*/

//-----------------------------------------------------------------------------------------------------
/*import 'package:bloc/bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageCubit extends Cubit<List<String>> {
  ImageCubit() : super([]);

  final SupabaseClient supabase = Supabase.instance.client;

  // دالة لتحميل روابط الصور من Subabase Storage
  Future<void> loadImages() async {
    try {
      // جلب الملفات من التخزين
      final response = await supabase.storage.from('images').list();
     
      // التحقق من أن الاستجابة تحتوي على ملفات
      if (response.isEmpty) {
        print('No files found.');
        return;
      }

      // استخراج الروابط العامة للملفات
      final imageUrls = response.map((file) => supabase.storage.from('images').getPublicUrl(file.name)).toList();
      print('Loaded image URLs: $imageUrls');

      // تحديث الحالة بالروابط
      emit(imageUrls);
    } catch (e) {
      // التعامل مع الأخطاء
      print('Error loading images: $e');
    }
  }
}

class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Images from Subabase'),
      ),
      body: BlocProvider(
        create: (_) => ImageCubit()..loadImages(),
        child: BlocBuilder<ImageCubit, List<String>>(
          builder: (context, imageUrls) {
            if (imageUrls.isEmpty) {
              return Center(child: CircularProgressIndicator());
            }
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
              ),
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return Image.network(imageUrls[index]);
              },
            );
          },
        ),
      ),
    );
  }
}*/
//----------------------------------------------------------

/*import 'dart:io';
import 'package:path/path.dart' as b;
import 'package:supabase_flutter/supabase_flutter.dart';
class  Subabase {
 static late Supabase _supabase;
  createBucket(String bucketName)async{
await _supabase.client.storage.createBucket(bucketName);
 }
  initSupabase()async{
 _supabase=  await Supabase.initialize(
    url: 'https://xheqqusfcxldsogcflab.supabase.co', // استبدل بـ URL الخاص بك
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhoZXFxdXNmY3hsZHNvZ2NmbGFiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzM1OTE5OTUsImV4cCI6MjA0OTE2Nzk5NX0.frJQJZRftkHm4TmHm2ITqokERtYaD4L5yPYr6mN5zhc', // استبدل بـ مفتاح الـ anon-key الخاص بك
  );
}

Future<String> uploadfiles(File file,String path)async{
  String fileName=b.basename(file.path);
  String extensionName = b.extension(file.path);
var result =  await _supabase.client.storage.from('imagess').upload('$path/$fileName.$extensionName', file);
return result;
}

}*/
