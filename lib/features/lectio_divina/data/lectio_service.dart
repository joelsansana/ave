import '../domain/lectio_divina.dart';

class LectioService {
  static const List<LectioDivina> _lectiones = [
    LectioDivina(
      id: '1',
      title: 'O Amor de Deus',
      reference: 'João 3:16',
      introduction:
          'Deus amou tanto o mundo que deu o seu Filho único, para que todos os que acreditam nele não pereçam, mas tenham a vida eterna.',
      lectioText:
          '"Porque Deus amou tanto o mundo que deu o seu Filho único, para que todo o que nele crê não pereça, mas tenha a vida eterna."',
      lectioQuestion:
          'Que palavras ou frases tocam o vosso coração nesta leitura?',
      meditatioText:
          'O amor de Deus não é abstracto ou distante — é concreto, pessoal e ofereceu o próprio Filho. Este amor não depende da nossa capacidade de o merecer, mas é dado gratuitamente. É um amor que Se entrega completamente, sem reservas.',
      meditatioQuestion:
          'Como é que este amor de Deus Se manifesta na vossa vida hoje?',
      oratioText:
          "Depois de meditar no amor de Deus, reserve um momento para Lhe responder em silêncio ou em voz alta. Não há palavras certas ou erradas — apenas o vosso coração a falar com o d'Ele.",
      oratioPrompt:
          'Que quero dizer a Deus em resposta a este amor tão grande?',
      contemplatioText:
          'Descanse agora em silêncio na presença de Deus. Não tente pensar, analisar ou fazer qualquer coisa. Simplesmente esteja presente ao Amor que Se entregou por vós. Se surgirem pensamentos, deixe-os passar como nuvens no céu.',
      contemplatioPrompt:
          'Sinto-me amado(a)? Preciso de algo neste momento?',
    ),
    LectioDivina(
      id: '2',
      title: 'A Paz de Cristo',
      reference: 'João 14:27',
      introduction:
          'Jesus oferece-nos a sua paz — não a paz do mundo, mas uma paz profunda que nem as dificuldades podem tirar.',
      lectioText:
          '"Deixo-vos a paz; a minha paz vos dou. Não vo-la dou como o mundo a dá. Não se turbe o vosso coração, nem se atemorize."',
      lectioQuestion:
          'O que significa receber paz de Cristo, em comparação com a paz que o mundo oferece?',
      meditatioText:
          'A paz do mundo depende das circunstâncias — de tudo ir bem, de não haver problemas. Mas a paz de Cristo é diferente: permanece mesmo no meio das tempestades. É uma paz que vem de dentro, rooted na certeza da presença e do amor de Deus, independentemente do que aconteça à nossa volta.',
      meditatioQuestion:
          'Que tempestades estou a enfrentar? Onde preciso da paz de Cristo?',
      oratioText:
          'Partilhe com Cristo as vossas ansiedades e medos. Ele conhece-os já, mas Ele quer ouvi-los da vossa boca. Entregue-lhe cada preocupação, cada peso que carrega.',
      oratioPrompt:
          'Para que áreas da minha vida preciso de pedir a paz de Cristo?',
      contemplatioText:
          'Feche os olhos e imagine-se sentado aos pés de Jesus. Sinta a sua mão sobre a vossa cabeça. Descanse na certeza: Ele está aqui, e a sua paz permanece.',
      contemplatioPrompt:
          'Consigo sentir a paz de Cristo a envolver-me?',
    ),
    LectioDivina(
      id: '3',
      title: 'O Bom Pastor',
      reference: 'João 10:11-15',
      introduction:
          'Jesus chama-Se o Bom Pastor. Um pastor que conhece cada ovelha pelo nome, que dá a vida pelas suas ovelhas.',
      lectioText:
          '"Eu sou o bom pastor. O bom pastor dá a vida pelas suas ovelhas. O hired man, que não é pastor, abandona as ovelhas quando vê o lobo chegar."',
      lectioQuestion:
          'Como é que Jesus, como Bom Pastor, Se distingue de outros que prometem cuidar de nós?',
      meditatioText:
          'O bom pastor conhece as suas ovelhas — não apenas por nome, mas conhece-as intimamente: os seus medos, as suas alegrias, as suas lutas. Ele não apenas observa de longe, mas anda com elas, através de cada vale. E quando o perigo chega, Ele não foge — Ele dá a vida.',
      meditatioQuestion:
          'Como é que a minha relação com Deus se compara à de uma ovelha com o seu pastor? Entrego-lhe o meu cuidado ou tento resolver tudo sozinho?',
      oratioText:
          'Agradeça a Deus por Ele ser o seu Pastor. Peça-Lhe para o deixar guiar mais completamente. Reconheça as vezes em que se afastou do caminho.',
      oratioPrompt:
          'Onde é que me tenho afastado do Pastor? Que área da minha vida quero entregar ao Seu cuidado?',
      contemplatioText:
          'Imagine-se no meio do rebanho. Ouça o som da voz do Pastor. Reconheça que Ele vos conhece pelo nome e que nunca vos perde de vista.',
      contemplatioPrompt:
          'Sinto a presença do Pastor a caminhar comigo?',
    ),
    LectioDivina(
      id: '4',
      title: 'A Videira e os Ramos',
      reference: 'João 15:1-5',
      introduction:
          'Jesus diz-nos que Ele é a Videira verdadeira e que nós somos os ramos. Sem Ele, nada podemos fazer.',
      lectioText:
          '"Eu sou a videira verdadeira, e meu Pai é o agricultor. Todo o ramo que em mim não dá fruto, Ele corta-o; e todo o que dá fruto, Ele poda, para que dê mais fruto ainda."',
      lectioQuestion:
          'O que significa permanecer em Cristo? Como é que esse "permanecer" se manifesta na vida quotidiana?',
      meditatioText:
          'Jesus usa a imagem da videira para nos ensinar que a nossa vida espiritual não é algo que podemos cultivar sozinhos. Precisamos de estar ligados a Ele — como um ramo que recebe a seiva que lhe dá vida. Sem essa ligação, secamos. Com ela, florescemos.',
      meditatioQuestion:
          "Que actividades ou hábitos me ajudam a permanecer em Cristo? Que coisas na minha vida me afastam d'Ele?",
      oratioText:
          'Peça a Cristo para purificar os seus ramos — para podar o que não dá fruto e fortalecer o que dá. Ofereça-Lhe as áreas da sua vida que precisam de mudança.',
      oratioPrompt:
          'O que é que Cristo quer podar na minha vida? O que quero pedir que seja fortalecido?',
      contemplatioText:
          'Descanse na imagem de estar ligado a Cristo. Sinta a seiva espiritual a circular. Permaneça nesse sentido de pertença e conexão.',
      contemplatioPrompt:
          'Sinto a minha ligação a Cristo viva e forte?',
    ),
    LectioDivina(
      id: '5',
      title: 'A Oração Silenciosa',
      reference: 'Mateus 6:5-8',
      introduction:
          'Jesus ensina-nos como rezar — não para ser visto pelos outros, mas para nos relacionarmos com o Pai em segredo.',
      lectioText:
          '"Quando orares, entra no teu quarto, fecha a porta e ora ao teu Pai em secreto; e o teu Pai, que vê em secreto, te recompensará."',
      lectioQuestion:
          'Como é a minha vida de oração? Oro em público para mostrar a minha fé, ou oro em segredo para encontrar o Pai?',
      meditatioText:
          'A verdadeira oração não é performance — é encontro. Não precisa de palavras elaboradas ou de uma localização especial. A oração autêntica acontece quando nos retiramos do barulho do mundo e nos dirigimos simplesmente ao Pai, confiando que Ele ouve e responde.',
      meditatioQuestion:
          'Que obstáculos tenho à oração em segredo? Como posso criar mais espaço para estar a sós com Deus?',
      oratioText:
          'Não é necessário dizer palavras agora. Simplesmente esteja na presença de Deus. Deixe que o silêncio fale.',
      oratioPrompt:
          'O que quero dizer ao Pai, mesmo sem palavras?',
      contemplatioText:
          'Permaneça em silêncio. Deixe de tentar dizer ou fazer qualquer coisa. Apenas esteja. Deus está aqui, e este momento é suficiente.',
      contemplatioPrompt:
          'Consigo estar em silêncio perante Deus? O que sinto neste silêncio?',
    ),
    LectioDivina(
      id: '6',
      title: 'O Pai Perdoa',
      reference: 'Lucas 15:11-24',
      introduction:
          'Jesus conta a história do filho pródigo — uma história sobre o amor incondicional de um pai e a liberdade do perdão.',
      lectioText:
          '"O pai disse aos seus servos: Depressa! Tragam a melhor roupa e vistam-no. Coloquem um anel no seu dedo e sandálias nos seus pés. Tragam o vitelo gordo e matem-no. Comamos e celebrate-mos, porque este meu filho estava morto e tornou a viver, estava perdido e foi encontrado!"',
      lectioQuestion:
          'Como descreveria a atitude do pai face ao filho que o tinha abandonado?',
      meditatioText:
          'O pai nunca deixou de amar o filho, mesmo quando este partiu. Ele esperou, vigiando o horizonte. E quando o viu regressar, correu ao seu encontro — sem esperar um pedido de desculpas elaborado, sem condições. O amor do pai não dependia do merecimento do filho.',
      meditatioQuestion:
          'Há algo que me impede de voltar para Deus? Alguma culpa ou vergonha que me mantém afastado? Como é que a atitude do pai me faz sentir?',
      oratioText:
          'Deixe que Cristo lhe mostre a缚缚缚 do seu amor. Se há algo que o pesa, confesse-o agora. Ou simplesmente agradeça pela promessa de que Deus corre ao nosso encontro quando nos voltamos para Ele.',
      oratioPrompt:
          'O que é que me impede de aceitar o perdão de Deus? Ou: por que é que me custa perdoar-me a mim mesmo?',
      contemplatioText:
          'Imagine o pai a correr para si. Sinta os braços dele à sua volta. Ouça as palavras: "Este meu filho estava morto e tornou a viver."',
      contemplatioPrompt:
          'Sinto-me abraçado pelo Pai? Há alguém a quem preciso de perdoar, incluindo a mim mesmo?',
    ),
    LectioDivina(
      id: '7',
      title: 'A Esperança que Não Decepciona',
      reference: 'Romanos 5:1-5',
      introduction:
          'São Paulo escreve sobre a esperança que não decepciona — porque o amor de Deus foi derramado nos nossos corações pelo Espírito Santo.',
      lectioText:
          '"A esperança não decepciona, porque o amor de Deus foi derramado nos nossos corações pelo Espírito Santo que nos foi dado."',
      lectioQuestion:
          'O que significa para vós que a esperança não decepciona? Já experimentaram isso na vossa vida?',
      meditatioText:
          'Paulo escreve isto não como alguém que nunca sofreu, mas como alguém que atravessou tribulações. Ele sabe que o sofrimento produz perseverança, que a perseverança produz caráter, e que o caráter produz esperança. A esperança não é positividade forçada — é confiança baseada na fidelidade de Deus.',
      meditatioQuestion:
          'Que sofrimentos estou a enfrentar? Como é que posso transformar as minhas dificuldades em esperança?',
      oratioText:
          'Peça ao Espírito Santo que derrame o amor de Deus no vosso coração. Abra-se à esperança, mesmo quando as circunstâncias parecem sombrias.',
      oratioPrompt:
          'Que esperança spezifico quero pedir a Deus neste momento?',
      contemplatioText:
          'Sente-se com a imagem do amor de Deus a ser derramado — não como um balde de água, mas como algo que entra nos nossos poros, nos preenche, nos muda. Deixe-se encher.',
      contemplatioPrompt:
          'Sinto-me cheio(a) de esperança? O que está a impedir essa esperança?',
    ),
  ];

  static Future<LectioDivina> getLectioOfDay() async {
    await Future.delayed(const Duration(milliseconds: 50));
    final dayOfYear =
        DateTime.now().difference(DateTime(DateTime.now().year, 1, 1)).inDays;
    return _lectiones[dayOfYear % _lectiones.length];
  }

  static Future<List<LectioDivina>> getAll() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return _lectiones;
  }
}
