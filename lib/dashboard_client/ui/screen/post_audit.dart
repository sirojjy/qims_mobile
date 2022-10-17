import 'package:flutter/material.dart';
import 'package:qims_mobile/share/custom_appbar.dart';
import '../../../share/custom_collapse.dart';


class PostAuditClient extends StatefulWidget {
  const PostAuditClient({Key? key}) : super(key: key);

  @override
  State<PostAuditClient> createState() => _PostAuditClientState();
}

class _PostAuditClientState extends State<PostAuditClient> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          judul: 'Post Audit',
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                const SizedBox(height: 10,),
                CustomCollapse(
                  icons: Icons.date_range_rounded,
                  titles: 'Sertifikat',
                  descriptions: '',
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
