import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  State<Help> createState() => _HelpState();
}

class HelpItem {
  String headerValue;
  String expandedValue;

  HelpItem({
    required this.headerValue,
    required this.expandedValue,
  });
}

class _HelpState extends State<Help> {
  late String _selected;
  List<HelpItem> _items = [
    HelpItem(
      headerValue: 'Get Started',
      expandedValue:
          'The National Exam Card Student App streamlines the process of applying for exam cards while offering a convenient platform for students to stay updated on notifications and upcoming events. With intuitive features, students can seamlessly submit their exam card applications, ensuring they are fully prepared for their examinations. Additionally, the app serves as a centralized hub for important notifications, keeping users informed about deadlines, schedule changes, and other pertinent information. By providing easy access to these crucial resources, the app empowers students to manage their academic commitments efficiently and effectively.',
    ),
    HelpItem(
      headerValue: 'My Account',
      expandedValue:
          "The 'Account' tab in The National Exam Card Student App serves as a gateway for users to manage their personal information and access essential features. By logging in through this tab, users gain access to their personalized accounts, where they can customize settings and manage their academic profile with ease. From updating personal details to reviewing past exam records, the Account tab provides a comprehensive platform for users to stay organized and informed. Additionally, users can conveniently apply for exam cards directly from their accounts, streamlining the process and ensuring timely preparation for upcoming examinations. With its user-friendly interface and seamless integration of essential functions, the Account tab is an indispensable tool for students navigating their academic journey.",
    ),
    HelpItem(
      headerValue: 'Apply for Exam Card',
      expandedValue:
          'In the National Exam Card Student App, users can effortlessly apply for their exam cards by simply filling out a comprehensive form with all the necessary information. This includes details such as their school affiliation, full name, and date of birth (DOB). By inputting this crucial data, students ensure accurate identification and streamline the process for obtaining their exam cards. The user-friendly interface guides them through each step, making it easy to provide the required information accurately and efficiently. With this streamlined application process, students can focus their energy on preparing for their examinations, knowing that their administrative needs are being taken care of seamlessly through the app.',
    ),
    HelpItem(
      headerValue: 'Report an Issue',
      expandedValue:
          "Users of The National Exam Card Student App have the option to report any issues or concerns they encounter via our contact form, ensuring swift resolution and enhanced user experience. Through this form, users can provide essential information including their email address, name, and a detailed message outlining the nature of the problem they're experiencing. Alternatively, users can choose to connect with us through our social media links, facilitating direct communication and fostering a sense of community engagement. Whether reaching out via email or social media, our dedicated support team is committed to addressing user inquiries promptly and effectively, ensuring a seamless experience for all users of the app.",
    ),
    HelpItem(
      headerValue: 'Exam Results',
      expandedValue:
          "To check for exam results, users can conveniently navigate to the 'Update' tab within The National Exam Card Student App, where they can access the most recent updates. This feature provides a centralized platform for users to stay informed about their examination outcomes in a timely manner. By simply clicking on the 'Update' tab, users can view the latest announcements regarding their results, ensuring easy access to vital information. This streamlined process eliminates the need for users to navigate multiple sources, offering a hassle-free experience and allowing them to stay up-to-date with their academic progress effortlessly.",
    ),
    HelpItem(
      headerValue: 'Claim Marks',
      expandedValue:
          "Users of The National Exam Card Student App also have the convenience of claiming their marks directly through the platform by filling out a contact form. This user-friendly feature streamlines the process for students, allowing them to submit their mark claims efficiently. By providing essential details such as their name, email address, and a brief message outlining their mark discrepancy, users can initiate the resolution process promptly. This ensures that any errors or discrepancies in their exam results are addressed swiftly, promoting accuracy and fairness in academic assessments. With this integrated solution, students can navigate mark claim procedures seamlessly, enhancing their overall experience with the app.",
    ),
    HelpItem(
      headerValue: 'Privacy Policy',
      expandedValue:
          "Our Privacy Policy underscores our commitment to safeguarding the personal information of users within the National Exam Card Student App. We prioritize the protection and confidentiality of all data collected through the application. Any personal information provided by users, such as name, date of birth, and school affiliation, is securely stored and used solely for the purpose of facilitating the application process and improving user experience. We do not share, sell, or disclose this information to third parties without explicit consent, except where required by law or for essential app functionalities. Additionally, we employ robust security measures to prevent unauthorized access, alteration, or disclosure of user data. Users retain control over their personal information and may request its modification or deletion at any time. By using the National Exam Card Student App, users consent to the terms outlined in this Privacy Policy, demonstrating our unwavering commitment to their privacy and data protection.",
    ),
    HelpItem(
      headerValue: 'Terms & Conditions',
      expandedValue:
          "By accessing and using The National Exam Card Student App, users agree to abide by the following terms and conditions. Users acknowledge that all information provided during the application process, including personal details such as name, date of birth, and school affiliation, must be accurate and truthful. Users also understand that any misuse or misrepresentation of information may result in the rejection of their application or disciplinary action. The app reserves the right to verify the authenticity of provided information through appropriate channels. Additionally, users are responsible for maintaining the security of their account credentials and are prohibited from sharing their login details with others. The National Exam Card Student App reserves the right to modify, suspend, or terminate services at any time without prior notice. Users agree to use the app solely for its intended purpose and refrain from engaging in any unlawful or unauthorized activities. By continuing to use the app, users consent to these terms and conditions and accept any updates or modifications thereof.",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _selected = _items.first.headerValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _selected = _items[index].headerValue;
          });
        },
        children: _items.map<ExpansionPanel>((HelpItem item) {
          return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(
                  item.headerValue,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                item.expandedValue,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            isExpanded: item.headerValue == _selected,
          );
        }).toList(),
      ),
    );
  }
}
