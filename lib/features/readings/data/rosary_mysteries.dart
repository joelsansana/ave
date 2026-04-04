class RosaryMystery {
  final String title;
  final String subtitle;
  final String day;
  final List<MysteryMeditation> meditations;
  final String color;

  const RosaryMystery({
    required this.title,
    required this.subtitle,
    required this.day,
    required this.meditations,
    required this.color,
  });
}

class MysteryMeditation {
  final String decade;
  final String title;
  final String scripture;
  final String meditation;

  const MysteryMeditation({
    required this.decade,
    required this.title,
    required this.scripture,
    required this.meditation,
  });
}

class RosaryMysteries {
  static const List<RosaryMystery> mysteries = [
    // Mistérios Gozosos
    RosaryMystery(
      title: 'Mistérios Gozosos',
      subtitle: 'Segunda e Quinta-feira',
      day: 'Monday',
      color: 'yellow',
      meditations: [
        MysteryMeditation(
          decade: '1º Mistério',
          title: 'Anunciação do Anjo',
          scripture: 'Lucas 1:26-38',
          meditation:
              'O anjo Gabriel foi enviado por Deus a uma virgem prometida em casamento... Maria respondeu: "Eis a serva do Senhor; que me aconteça segundo a tua palavra."',
        ),
        MysteryMeditation(
          decade: '2º Mistério',
          title: 'Visitação de Maria a Isabel',
          scripture: 'Lucas 1:39-56',
          meditation:
              'Maria partiu para a região montanhosa... e entrou em casa de Zacarias e saudou Isabel. Isabel disse: "Bendita és tu entre as mulheres e bendito é o fruto do teu ventre."',
        ),
        MysteryMeditation(
          decade: '3º Mistério',
          title: 'Nascimento de Jesus',
          scripture: 'Lucas 2:1-20',
          meditation:
              'Deus tornou-se homem por nós e nasceu numa manjedoura. Os anjos anunciaram aos pastors: "Hoje vos nasceu um Salvador, que é Cristo o Senhor."',
        ),
        MysteryMeditation(
          decade: '4º Mistério',
          title: 'Apresentação de Jesus no Templo',
          scripture: 'Lucas 2:22-40',
          meditation:
              'Maria e José apresentaram Jesus ao Senhor no templo. O velho Simeão, guiado pelo Espírito, reconheceu o Messias e abençoou Deus: "Agora, Senhor, deixa o teu servo partir em paz."',
        ),
        MysteryMeditation(
          decade: '5º Mistério',
          title: 'Jesus perdido e encontrado no Templo',
          scripture: 'Lucas 2:41-52',
          meditation:
              'Maria e José encontraram Jesus no templo, sentado entre os mestres, a ouvir e a perguntar. Ele disse: "Não sabíeis que Eu devo estar na casa de meu Pai?"',
        ),
      ],
    ),

    // Mistérios Luminosos
    RosaryMystery(
      title: 'Mistérios Luminosos',
      subtitle: 'Quintas-feiras',
      day: 'Thursday',
      color: 'lightBlue',
      meditations: [
        MysteryMeditation(
          decade: '1º Mistério',
          title: 'Batismo de Jesus no Jordão',
          scripture: 'Marcos 1:9-11',
          meditation:
              'Jesus foi batizado por João no Jordão. Ao subir da água, viu o céu aberto e o Espírito descer sobre Ele como pomba. Uma voz do céu disse: "Tu és o meu Filho muito amado, em Ti me agrado."',
        ),
        MysteryMeditation(
          decade: '2º Mistério',
          title: 'Auto-revelação nas Bodas de Caná',
          scripture: 'João 2:1-11',
          meditation:
              'Na Galileia, numa boda em Caná, faltou vinho. Jesus disse à Virgem: "Mulher, que tenho Eu contigo? Ainda não chegou a minha hora." A Virgem disse aos serventes: "Fazei o que Ele vos disser."',
        ),
        MysteryMeditation(
          decade: '3º Mistério',
          title: 'Anúncio do Reino de Deus',
          scripture: 'Marcos 1:14-15',
          meditation:
              'Jesus proclamou a Boa Nova: "O tempo cumprido-se e o Reino de Deus está próximo; arrependei-vos e crede na Boa Nova."',
        ),
        MysteryMeditation(
          decade: '4º Mistério',
          title: 'Transfiguração',
          scripture: 'Mateus 17:1-9',
          meditation:
              'Jesus levou Pedro, Tiago e João a um alto monte e transfigurou-se diante deles. O Seu rosto brilhou como o sol e as suas vestes tornaram-se brancas como a luz. Uma voz do céu disse: "Este é o meu Filho muito amado, escutai-O."',
        ),
        MysteryMeditation(
          decade: '5º Mistério',
          title: 'Instituição da Eucaristia',
          scripture: 'João 13:1-15',
          meditation:
              'Na noite da Última Ceia, Jesus lavou os pés dos discípulos e disse: "Eu vos dou um novo mandamento: que vos ameis uns aos outros, como Eu vos amei."',
        ),
      ],
    ),

    // Mistérios Dolorosos
    RosaryMystery(
      title: 'Mistérios Dolorosos',
      subtitle: 'Terça e Sexta-feira',
      day: 'Tuesday',
      color: 'red',
      meditations: [
        MysteryMeditation(
          decade: '1º Mistério',
          title: 'Oração de Jesus no Horto',
          scripture: 'Mateus 26:36-46',
          meditation:
              'Jesus foi com os discípulos para um horto chamado Getsamani e começou a sentir medo e angústia. Disse-lhes: "A minha alma está numa tristeza mortal; ficai aqui e vigiai comigo."',
        ),
        MysteryMeditation(
          decade: '2º Mistério',
          title: 'Flagelação de Jesus',
          scripture: 'João 19:1-3',
          meditation:
              'Pilatos mandou que Jesus fosse flagelado. Os soldados teceram uma coroa de espinhos e puseram-na na Sua cabeça, e vestiram-nO com um manto roxo.',
        ),
        MysteryMeditation(
          decade: '3º Mistério',
          title: 'Coroação de Espinhos',
          scripture: 'Mateus 27:27-31',
          meditation:
              'Os soldados, tendo reunida toda a guarda, levaram Jesus ao pretório e vestiram-nO com um manto de escarlata. Puseram-lhe na cabeça uma coroa de espinhos e uma cana na mão direita.',
        ),
        MysteryMeditation(
          decade: '4º Mistério',
          title: 'Jesus carrega a Cruz',
          scripture: 'João 19:17',
          meditation:
              "Jesus, carregando a Cruz, saiu para o lugar chamado Calvário. Seguiam-n'O uma grande multidão do povo e de mulheres que batiam no peito e lamentavam por Ele.",
        ),
        MysteryMeditation(
          decade: '5º Mistério',
          title: 'Crucifixão e Morte de Jesus',
          scripture: 'João 19:18-30',
          meditation:
              'Estando Jesus crucificado, entregou o espírito. Era quase meio-dia e havia trevas sobre toda a terra até à nona hora, porque o sol se avait eclipse.',
        ),
      ],
    ),

    // Mistérios Gloriosos
    RosaryMystery(
      title: 'Mistérios Gloriosos',
      subtitle: 'Quarta, Sábado e Domingo',
      day: 'Wednesday',
      color: 'blue',
      meditations: [
        MysteryMeditation(
          decade: '1º Mistério',
          title: 'Ressurreição de Jesus',
          scripture: 'João 20:1-10',
          meditation:
              'No primeiro dia da semana, Maria Madalena foi ao túmulo de Jesus ao amanhecer e viu que a pedra tinha sido tirada. Correu ter com Simão Pedro e disse: "Tiraram o Senhor do túmulo."',
        ),
        MysteryMeditation(
          decade: '2º Mistério',
          title: 'Ascensão de Jesus ao Céu',
          scripture: 'Atos 1:6-11',
          meditation:
              "Jesus levou os discípulos até às imediações de Betânia e, erguendo as mãos, abençoou-os. E enquanto os abençoava, elevou-se ao céu e uma nuvem l'O ocultou à vista deles.",
        ),
        MysteryMeditation(
          decade: '3º Mistério',
          title: 'Descida do Espírito Santo',
          scripture: 'Atos 2:1-13',
          meditation:
              'Estando reunidos os discípulos, veio do céu um ruído como de vento impetuoso e apareceram umas línguas repartidas como de fogo. Todos foram cheios do Espírito Santo.',
        ),
        MysteryMeditation(
          decade: '4º Mistério',
          title: 'Assunção de Maria ao Céu',
          scripture: 'Apocalipse 12:1',
          meditation:
              'Apareceu no céu um grande sinal: uma mulher vestida de sol, com a lua debaixo dos pés e uma coroa de doze estrelas sobre a cabeça. Maria foi assumida ao céu em corpo e alma.',
        ),
        MysteryMeditation(
          decade: '5º Mistério',
          title: 'Coronação de Maria como Rainha do Céu',
          scripture: 'Apocalipse 12:1; 11:19',
          meditation:
              'Abriu-se o templo de Deus no céu e foi vista a arca da sua aliança. Deus deu a Maria o título de Rainha do Céu e dos Anjos, coroando-a como soberana de todo o universo.',
        ),
      ],
    ),
  ];

  /// Get today's mysteries based on day of week
  static RosaryMystery getTodaysMysteries() {
    final dayOfWeek = DateTime.now().weekday;
    // Sunday = 7, Monday = 1, etc.
    final dayMap = {
      1: 'Monday',   // Segunda - Gozosos
      2: 'Tuesday',  // Terça - Dolorosos
      3: 'Wednesday', // Quarta - Gloriosos
      4: 'Thursday',  // Quinta - Luminosos
      5: 'Friday',    // Sexta - Dolorosos
      6: 'Saturday',  // Sábado - Gloriosos
      7: 'Sunday',    // Domingo - Gloriosos
    };
    final targetDay = dayMap[dayOfWeek]!;

    for (final mystery in mysteries) {
      if (mystery.day == targetDay ||
          (targetDay == 'Sunday' && mystery.day == 'Wednesday') ||
          (targetDay == 'Saturday' && mystery.day == 'Wednesday')) {
        return mystery;
      }
    }
    return mysteries[3]; // Default to Glorious
  }

  static List<RosaryMystery> getAll() => mysteries;
}
