import 'package:flutter/material.dart';
import 'package:motorquiz/result.dart';

import 'quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mr.Anderson Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'MotoQuiz'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _questionIndex = 0;
  var _totalCorrect = 0;

  final List<Question> _questions = [
    Question(
        question:
        "Waarop controleer je de verlichting van je voertuig?",
        answers: [
          Answer(answer: "Op de helderheid van het glas"),
          Answer(answer: "Op het functioneren en op de helderheid van het glas", isCorrect: true),
          Answer(answer: "Op de helderheid van het glas en op de aanwezigheid van een reserveset lampen"),
        ],
        description: "Geen uitleg"),
    Question(
        question:
            "Welke volgafstand moet je tenminste aanhouden bij een snelheid van 100 kilometer per uur?",
        answers: [
          Answer(answer: "Ongeveer 35 meter"),
          Answer(answer: "Ongeveer 55 meter", isCorrect: true),
          Answer(answer: "Ongeveer 100 meter"),
        ],
        description: "Zorg er altijd voor dat je een minimale volgafstand aanhoudt die je in twee seconden aflegt. Bij 100 kilometer per uur is dat volgens de vuistregel een afstand van 55 meter (100:2 plus 10%)."),
    Question(
        question: "Wat is iemand die met een paard aan de hand loopt?",
        answers: [
          Answer(answer: "Een bestuurder", isCorrect: true),
          Answer(answer: "Een voetganger")
        ],
        description: "De geleiders van rij- of trekdieren of van vee horen bij de categorie bestuurders. Net als ruiters. Iemand die met een paard aan de hand loopt is een geleider van een rijdier. Deze persoon is dus een bestuurder."),
    Question(
        question: "Wat doe je voordat je met de motor een smalle tunnel inrijdt?",
        answers: [
          Answer(answer: "Je haalt niet in", isCorrect: true),
          Answer(answer: "Je houdt dezelfde afstand als altijd"),
          Answer(answer: "Je gaat links rijden")
        ],
        description: "Tunnel rijden vereist aangepast,alert rijgedrag ontsteek je dimlicht ruim voordat je de tunnel in rijd."),
    Question(
        question: "Je gaat motorrijden. Welke documenten moet je bij je hebben?",
        answers: [
          Answer(answer: "Het rijbewijs"),
          Answer(answer: "Het rijbewijs en het kentekenbewijs", isCorrect: true),
          Answer(answer: "Het rijbewijs en het kentekenbewijs en het verzekeringsbewijs")
        ],
        description: "Het rijbewijs en kentekenbewijs (kentekencard) moet je altijd tijdens een controle kunnen tonen. Het verzekeringsbewijs (groene kaart) is alleen nodig in het buitenland."),
    Question(
        question: "Wanneer kun je de bandenspanning het beste meten?",
        answers: [
          Answer(answer: "Direct na afloop van de rit"),
          Answer(answer: "Voor vertrek", isCorrect: true),
          Answer(answer: "Na een uurtje te hebben gereden")
        ],
        description: "Door te rijden neemt de temperatuur van de band toe en de spanning zal iets hoger zijn. Het is dus beter om de spanning voor vertrek te meten."),
    Question(
        question: "Wat gebeurt er met het brandstofverbruik als je goed anticipeert?",
        answers: [
          Answer(answer: "Dit wordt lager", isCorrect: true),
          Answer(answer: "Dit wordt hoger"),
          Answer(answer: "Dit blijft gelijk")
        ],
        description: "Als je goed anticipeert stel je je op tijd in op mogelijke gebeurtenissen in het verkeer. Je kunt dan op tijd hierop inspelen door het gas los te laten en onnodig remmen te voorkomen. Daarmee bespaar je aanzienlijk op het brandstofverbruik."),
    Question(
        question: "Wanneer kun je last krijgen van aquaplaning?",
        answers: [
          Answer(answer: "Bij mist"),
          Answer(answer: "Bij regen", isCorrect: true),
          Answer(answer: "Bij sneeuw")
        ],
        description: "Aquaplaning ontstaat als door veel water op het wegdek de banden het contact met het wegdek verliezen. Aquaplaning ontstaat sneller bij veel water, hoge snelheid, weinig bandenprofiel en brede banden. Pas daarom je snelheid aan als het hard regent."),
    Question(
        question: "Wat is de maximum gevangenisstraf voor het rijden onder invloed van drugs?",
        answers: [
          Answer(answer: "3 maanden"),
          Answer(answer: "6 maanden"),
          Answer(answer: "1 jaar", isCorrect: true)
        ],
        description: "Volgens de wet wordt 'onder invloed rijden' gestraft met een gevangenisstraf van ten hoogste 1 jaar of een geldboete van 21.750 euro. Daarnaast kan er ook een bijkomende straf worden opgelegd, zoals het verplicht volgen van een cursus of het ontzeggen van de rijbevoegdheid."),
    Question(
        question: "Hoeveel afstand moet je zijdelings minimaal nemen als je een fietser wilt inhalen?",
        answers: [
          Answer(answer: "1,5 M", isCorrect: true),
          Answer(answer: "3 M"),
          Answer(answer: "0,50 cm")
        ],
        description: "0,5 meter is dus te weinig. 3 meter is te veel, dan zit je op de verkeerde kant van de weg."),
    Question(
        question: "Je bent 25 jaar en hebt alcohol gedronken. Mag je met een alcoholpercentage van 0,6 ‰ gaan rijden?",
        answers: [
          Answer(answer: "Zeker"),
          Answer(answer: "Nope", isCorrect: true)
        ],
        description: "Ook als je geen beginnende bestuurder meer bent, mag je met een alcoholpercentage van 0,6 ‰ niet meer gaan rijden. Het maximumpromillage is 0,5 en voor beginnende bestuurders is deze 0,2 ‰."),
    Question(
        question: "Je rijdt met een zijspan naast je motor. Het zijspan zit aan de rechterkant van de motor. Wanneer kan het zijspan boven de weg gaan zweven?",
        answers: [
          Answer(answer: "Als je een snelle bocht naar links rijdt"),
          Answer(answer: "Als je een snelle bocht naar rechts rijdt", isCorrect: true),
          Answer(answer: "Als de motor zwaarder is dan het zijspan")
        ],
        description: "Als je met je motor met een rechtse zijspan een snelle bocht naar rechts maakt, zal de kracht in de bocht de bestuurder naar de buitenkant 'drukken', daarbij heeft het zijspan de neiging omhoog te komen. Bij een linkse bocht werkt het andersom en komt er meer druk op de zijspan."),
    Question(
        question: "Je rijdt met winterbanden op een droog wegdek. Waar let je op?",
        answers: [
          Answer(answer: "Je rijdt maximaal 80 km per uur"),
          Answer(answer: "Je rijdt maximaal 100 km per uur"),
          Answer(answer: "Je rijdt niet sneller dan wat de bandenfabriek je adviseert", isCorrect: true)
        ],
        description: "Het weggedrag voor voertuigen met winterbanden op een droog wegdek is anders dan met zomerbanden. Rijd daarom niet sneller dan wat de bandenfabrikant je adviseert. Dit kun je zien aan de snelheidscodering op de band."),
    Question(
        question: "Met welk verschil in snelheid mag je een langzaam rijdende file inhalen?",
        answers: [
          Answer(answer: "maximaal 10 km/uur", isCorrect: true),
          Answer(answer: "maximaal 30 km/uur"),
          Answer(answer: "maximaal 50 km/uur")
        ],
        description: "Sommigen vinden het niet prettig als je inhaalt. Ze moeten zelf namelijk wachten en zijn daarom jaloers op jou. Het kan gebeuren dat ze het gat voor jou dichtgooien. Het kan ook zijn dat ze je niet zien en met allerlei dingen bezig zijn die niets met het verkeer te maken hebben."),
    Question(
        question: "Je hebt een windscherm en kappen op je motor gezet. Waar let je op?",
        answers: [
          Answer(answer: "Je wordt meer tegengehouden door de wind. Daardoor kan je minder goed sturen"),
          Answer(answer: "Je wordt minder tegengehouden door de wind. Daardoor ga je harder rijden", isCorrect: true)
        ],
        description: "Door het gebruik van een windscherm en kappen op de motor zal de rijwind gestroomlijnder langs jou en de motor heen gaan. De winddruk op je lichaam en het windgeluid nemen hiermee af en daardoor het gevoel van snelheid. De neiging ontstaat om sneller te gaan rijden, houd daarom de snelheidsmeter goed in de gaten."),
    Question(
        question: "50 meter voor je rijdt een tractor en je nadert een kruispunt, waar moet je rekening mee houden?",
        answers: [
          Answer(answer: "Je moet bestuurders van tractoren tijdig naderen, want ze zien je aankomen ondanks de lading"),
          Answer(answer: "Door de lading hebben bestuurders van tractoren vaak geen goed zicht naar achteren", isCorrect: true)
        ],
        description: "Houd er rekening mee dat de tractor een inrit kan opdraaien zonder dat je hem richting aan hebt zien geven. Vaak is de verlichting niet in orde of zit er modder op."),
    Question(
        question: "Bij een politiecontrole blijkt dat je voertuig te veel geluid maakt. Wat kan de politie doen?",
        answers: [
          Answer(answer: "Rijbewijs innemen"),
          Answer(answer: "Kentekenbewijs innemen", isCorrect: true),
          Answer(answer: "Rijbewijs en kentekenbewijs innemen")
        ],
        description: "Als je voertuig niet meer voldoet aan de wettelijke eisen kan de politie het kentekenbewijs innemen. Je krijgt het kentekenbewijs pas terug als het voertuig weer aan de eisen voldoet. Het rijbewijs wordt slechts ingenomen in verband met het rijgedrag."),
  ];

  void _answerQuestion(bool isCorrect, String description) {
    if (isCorrect) {
      _totalCorrect++;
    }

    showDialog(
      context: context,
      child: AlertDialog(
        title: Text(isCorrect ? "Correct" : "Fout"),
        content: Text(description),
        actions: [
          FlatButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );

    setState(() {
      _questionIndex++;
    });
  }

  void _reset() {
    setState(() {
      _totalCorrect = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              questions: _questions,
              questionIndex: _questionIndex,
              answerQuestion: _answerQuestion)
          : Result(_totalCorrect, _questions.length, _reset),
    );
  }
}

class Question {
  String question;
  List<Answer> answers;
  String description;

  Question({this.question, this.answers, this.description});
}

class Answer {
  String answer;
  bool isCorrect;

  Answer({this.answer, this.isCorrect = false});
}
