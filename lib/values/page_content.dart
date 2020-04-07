import '../models/page_view_model.dart';

List<PageContent> pageContentList = [
  PageContent(
    pageHeading: "4 Symptoms of\nCovid-19",
    heading1: 'Covid-19',
    heading2: 'Symptoms',
    heading3: 'These symptoms may appear 2-14 days after exposure.',
    content: <SubContent>[
      SubContent(
        title: 'High Fever',
        details: 'People who are older with edical conditions such as heart or lung desease..',
        imagePath: 'assets/symptoms/high_fever.png',
      ),
      SubContent(
        title: 'Dry Cough',
        details: 'It appears to spred form person to person among those in colse contact.',
        imagePath: 'assets/symptoms/cough.png',
      ),
      SubContent(
        title: 'Headache',
        details: 'Excited or tense, often to the point of holding the breath..',
        imagePath: 'assets/symptoms/headache.png',
      ),
      SubContent(
        title: 'Sore Throat',
        details: 'The severity of COVID-19 symptoms can range from very mild to severe.',
        imagePath: 'assets/symptoms/sore_throat.png',
      )
    ]
  ),
  PageContent(
    pageHeading: "Covid-19\nprevention",
    heading1: 'Covid-19',
    heading2: 'Prevention',
    heading3: 'Do these things to prevent Conid-19.',
    content: <SubContent>[
      SubContent(
        title: 'Wash hands',
        details: 'Wash your hands regularly for 20 seconds, with soap and water or alcohol-based hand rub.',
        imagePath: 'assets/prevention/wash_hands.png',
      ),
       SubContent(
        title: 'Use mask',
        details: 'Always cover your mouth and nose with mask whenever going outside.',
        imagePath: 'assets/prevention/face_mask.png',
      ),
       SubContent(
        title: 'Avoid contact',
        details: 'Avoid close contact (1 meter or 3 feet) with people who are unwell.',
        imagePath: 'assets/prevention/avoid_contact.png',
      ),
       SubContent(
        title: 'Cover cough',
        details: 'Cover your nose and mouth with a disposable tissue or flexed elbow when you cough or sneeze',
        imagePath: 'assets/prevention/cover_cough.png',
      ),
       
    ]
  ),
];