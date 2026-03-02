import 'package:flutter/material.dart';

class PrayersData {
  // ROSÁRIO COMPLETO
  static Map<String, dynamic> get Rosario => {
    'title': 'Rosário',
    'sections': [
      {
        'title': 'Sinal da Cruz',
        'lines': [
          {'latin': '✠ In nómine Patris, et Fílii, et Spíritus Sancti.', 'portuguese': '✠ Em nome do Pai e do Filho e do Espírito Santo.'},
          {'latin': '℟. Amen.', 'portuguese': '℟. Amen.'},
        ],
      },
      {
        'title': 'Credo',
        'lines': [
          {'latin': 'Credo in Deum, Patrem omnipoténtem, Creatórem cæli et terræ.', 'portuguese': 'Creio em Deus, Pai todo-poderoso, Criador do Céu e da Terra.'},
          {'latin': 'Et in Jesum Christum, Fílium ejus únicum, Dóminùm nostrum.', 'portuguese': 'E em Jesus Cristo, seu único Filho, Nosso Senhor.'},
          {'latin': 'Qui concéptus est de Spíritu Sancto, natus ex María Vírgine.', 'portuguese': 'Que foi concebido pelo poder do Espírito Santo; nasceu da Virgem Maria.'},
          {'latin': 'Passus sub Pontio Piláto, crucifíxus, mórtuus, et sepúltus.', 'portuguese': 'Padeceu sob Pôncio Pilatos, foi crucificado, morto e sepultado.'},
          {'latin': 'Descéndit ad ínferos; tértia die resurréxit a mórtuis.', 'portuguese': 'Desceu à mansão dos mortos; ressuscitou ao terceiro dia.'},
          {'latin': 'Ascéndit ad cælos; sedet ad déxteram Dei Patris omnipoténtis.', 'portuguese': 'Subiu aos Céus, onde está sentado à direita de Deus Pai todo-poderoso.'},
          {'latin': 'Inde ventúrus est judicáre vivos et mórtuos.', 'portuguese': 'De onde há-de vir a julgar os vivos e os mortos.'},
          {'latin': 'Credo in Spíritum Sanctum, sanctam Ecclésiam cathólicam.', 'portuguese': 'Creio no Espírito Santo, na santa Igreja Católica.'},
          {'latin': 'Sanctórum communionem, remissiónem peccatórum.', 'portuguese': 'Na comunhão dos Santos; na remissão dos pecados.'},
          {'latin': 'Carnis resurrectiónem, vitam ætérnam. Amen.', 'portuguese': 'Na ressurreição da carne; na vida eterna. Amen.'},
        ],
      },
      {
        'title': 'Oferecimento',
        'lines': [
          {'latin': '', 'portuguese': 'Santíssima Virgem, Mãe de Deus, eu Vos ofereço este rosário em desagravo do Santíssimo Coração de Nosso Senhor Jesus Cristo, Vosso Filho, e em desagrado do Vosso Coração Imaculado; e pelas intenções que Vos apresento.'},
        ],
      },
      {
        'title': 'Pai Nosso (Contas Grandes)',
        'lines': [
          {'latin': '℣. Pater noster, qui es in cælis: sanctificétur nomen tuum.', 'portuguese': '℣. Pai Nosso, que estais nos céus, santificado seja o Vosso Nome.'},
          {'latin': 'Advéniat regimen tuum: fiat volúntas tua, sicut in cælo, et in terra.', 'portuguese': 'Venha a nós o Vosso Reino; seja feita a Vossa vontade assim na terra como no Céu.'},
          {'latin': '℟. Panem nostrum quotidiánum da nobis hódie.', 'portuguese': '℟. O pão nosso de cada dia nos dai hoje.'},
          {'latin': 'Et dimítte nobis débita nostra, sicut et nos dimíttimus debitóribus nostris.', 'portuguese': 'Perdoai-nos as nossas dívidas, assim como nós perdoamos aos nossos devedores.'},
          {'latin': 'Et ne nos indúcas in tentatiónem. Sed líbera nos a malo. Amen.', 'portuguese': 'E não nos deixeis cair em tentação; mas livrai-nos do mal. Amen.'},
        ],
      },
      {
        'title': 'Ave Maria (10x - Contas Pequenas)',
        'lines': [
          {'latin': '℣. Ave, María, grátia plena, Dóminus tecum;', 'portuguese': '℣. Ave, Maria, Cheia de graça, o Senhor é convosco.'},
          {'latin': 'Benedícta tu in muliéribus, et benedíctus fructus ventris tui, Jesus.', 'portuguese': 'Bendita sois Vós entre as mulheres, e bendito é o fruto do Vosso ventre, Jesus.'},
          {'latin': '℟. Sancta María, Mater Dei, ora pro nobis peccatóribus,', 'portuguese': '℟. Santa Maria, Mãe de Deus, rogai por nós, pecadores.'},
          {'latin': 'Nunc, et in hora mortis nostræ. Amen.', 'portuguese': 'Agora e na hora da nossa morte. Amen.'},
        ],
      },
      {
        'title': 'Glória',
        'lines': [
          {'latin': '℣. Glória Patri, et Fílio, et Spíritui Sancto.', 'portuguese': '℣. Glória ao Pai, e ao Filho e ao Espírito Santo.'},
          {'latin': '℟. Sicut erat in princípio, et nunc, et semper, et in sǽcula sæculórum. Amen.', 'portuguese': '℟. Assim como era no princípio, agora e sempre, e por todos os séculos dos séculos. Amen.'},
        ],
      },
      {
        'title': 'Oração Final',
        'lines': [
          {'latin': '℣. O Maria sine labe concepta.', 'portuguese': '℣. Ó Maria concebida sem pecado.'},
          {'latin': '℟. Ora pro nobis, qui confugimus ad te.', 'portuguese': '℟. Rogai por nós que recorremos a vós.'},
        ],
      },
      {
        'title': 'Salve Rainha',
        'lines': [
          {'latin': 'Salve, Regina, Mater misericórdiæ, vita, dulcédo et spes nostra, salve!', 'portuguese': 'Salvé, Rainha, mãe de misericórdia, vida, doçura, esperança nossa, salve!'},
          {'latin': 'Ad te clamámus, éxsules fílii Hevæ. Ad te suspirámus geméntes et flentes in hac lacrimárum vale.', 'portuguese': 'A Vós bradamos, os degredados filhos de Eva. A Vós suspiramos, gemendo e chorando neste vale de lágrimas.'},
          {'latin': 'Éia ergo, advocáta nostra, illos tuos misericórdes óculos ad nos convérte.', 'portuguese': 'Eia, pois, advogada nossa, esses Vossos olhos misericordiosos a nós volvei.'},
          {'latin': 'Et Jesum benedíctum fructum ventris tui, nobis, post hoc exsílium, osténde.', 'portuguese': 'E, depois deste desterro, nos mostrai Jesus, bendito fruto do Vosso ventre.'},
          {'latin': 'O clemens, o pia, o dulcis Virgo Maria!', 'portuguese': 'Ó clemente, ó piedosa, ó doce Virgem Maria!'},
        ],
      },
    ],
    'mysterios': {
      'gozosos': {
        'title': 'Mistérios Gozosos',
        'days': 'Segunda-feira e Quinta-feira',
        'mysteries': [
          {'title': '1º Mistério: Anunciação', 'meditation': 'Meditemos na Anunciação do Arcanjo São Gabriel à Santíssima Virgem, e roguemos a virtude da humildade.'},
          {'title': '2º Mistério: Visitação', 'meditation': 'Meditemos na Visitação da Santíssima Virgem a Sua Prima, Santa Isabel, e roguemos a caridade para com o próximo.'},
          {'title': '3º Mistério: Nascimento', 'meditation': 'Meditemos no Nascimento do Menino Jesus, e roguemos o desprendimento dos bens do mundo.'},
          {'title': '4º Mistério: Apresentação', 'meditation': 'Meditemos na Apresentação do Menino Jesus no Templo e na Purificação de Nossa Senhora, e roguemos a obediência e a pureza do espírito e do coração.'},
          {'title': '5º Mistério: Perda e Encontro', 'meditation': 'Meditemos na Perda e no Encontro do Menino Jesus no Templo, e roguemos o conhecimento das coisas divinas e a prontidão no serviço de Deus.'},
        ],
      },
      'dolorosos': {
        'title': 'Mistérios Dolorosos',
        'days': 'Terça-feira e Sexta-feira',
        'mysteries': [
          {'title': '1º Mistério: Agonia', 'meditation': 'Meditemos na Agonia de N. S. Jesus Cristo, e roguemos a contrição dos nossos pecados.'},
          {'title': '2º Mistério: Flagelação', 'meditation': 'Meditemos na flagelação de N. S. Jesus Cristo, e roguemos a mortificação dos sentidos.'},
          {'title': '3º Mistério: Coroação de Espinhos', 'meditation': 'Meditemos na Coroação de Espinhos de N. S. Jesus Cristo, e roguemos a mortificação do espírito e do coração.'},
          {'title': '4º Mistério: Caminho do Calvário', 'meditation': 'Meditemos em N. S. Jesus Cristo levando a Cruz para o Calvário, e roguemos a paciência e a resignação.'},
          {'title': '5º Mistério: Crucifixão', 'meditation': 'Meditemos na Crucifixão e Morte de N. S. Jesus Cristo, e roguemos o amor a Deus e a salvação das almas.'},
        ],
      },
      'gloriosos': {
        'title': 'Mistérios Gloriosos',
        'days': 'Quarta-feira, Sábado e Domingo',
        'mysteries': [
          {'title': '1º Mistério: Ressurreição', 'meditation': 'Meditemos na Ressurreição de N. S. Jesus Cristo, e roguemos para recebermos o dom da fé e para a conversão dos pecadores.'},
          {'title': '2º Mistério: Ascensão', 'meditation': 'Meditemos na Ascensão de N. S. Jesus Cristo, e roguemos a esperança e o desejo do céu.'},
          {'title': '3º Mistério: Pentecostes', 'meditation': 'Meditemos na descida do Divino Espírito Santo, e roguemos o amor a Deus e o zelo da salvação das almas.'},
          {'title': '4º Mistério: Assunção', 'meditation': 'Meditemos na Assunção da Santíssima Virgem, e roguemos a graça de uma boa morte e a devoção a Nossa Senhora.'},
          {'title': '5º Mistério: Coroação de Maria', 'meditation': 'Meditemos na Coroação da Santíssima Virgem, e roguemos a perseverança final e a confiança em Nossa Senhora.'},
        ],
      },
    },
  };

  // VIA SACRA
  static Map<String, dynamic> get ViaSacra => {
    'title': 'Via Sacra',
    'intro': 'Meu Senhor e meu Deus, sob o olhar amoroso de Nossa Mãe, dispomo-nos a acompanhar-Vos pelo caminho de dor que foi o preço do nosso resgate. Queremos sofrer tudo o que Vós sufrestes, oferecer-Vos o nosso pobre coração, contrito, porque sois inocente e vais sofrer por nós, que somos os únicos culpados.',
    'stations': [
      {
        'station': 1,
        'title': 'Jesus é condenado à morte',
        'meditation': 'Nesta primeira estação contemplemos N. S. J. C., que, depois de cruelmente açoitado e coroado de espinhos, é levado pela segunda vez à presença de Pilatos, que por instigação dos judeus O condena à morte. E Jesus, que quer padecen e morrer para nos provar o seu amor e livrar-nos do Inferno, submete-se à condenação!... Ó misericordiosíssimo Jesus, fazei-nos compreender o vosso amor, e abrasai-nos nele.',
      },
      {
        'station': 2,
        'title': 'Jesus leva a Cruz aos ombros',
        'meditation': 'Nesta segunda estação contemplemos N. S. J. C., tratado com desprezo pelos algozes, que O obrigam a levar às costas, sobre as chagas vivas dos açoites, a pesadíssima Cruz em que vai ser crucificado para nos salvar! Ó misericordiosíssimo Jesus, ajudai-nos a sofrer generosamente por vosso amor os desprezos e humilhações de cada dia.',
      },
      {
        'station': 3,
        'title': 'Jesus cai sob o peso da Cruz',
        'meditation': 'Nesta terceira estação contemplemos N. S. J. C., arrastado e empurrado pelos algozes! Então cai sob o peso da Cruz e fere os joelhos nas pedras do caminho!... Ó misericordiosíssimo Jesus, pelas vossas chagas, concedei-nos a graça de detestar o pecado para melhor correspondermos ao vosso amor.',
      },
      {
        'station': 4,
        'title': 'Jesus encontra sua Mãe',
        'meditation': 'Nesta quarta estação contemplemos N. S. J. C., rodeado de seus inimigos e todo pisado e ensanguentado. Encontra sua Mãe, que num impulso de amor e dor corre para Ele através da multidão, que cruelmente O escarnece e se regozija com o sofrimento daquela terna Mãe e do seu carinhoso Filho!... Jesus e Maria, assisti-nos na última agonia.',
      },
      {
        'station': 5,
        'title': 'Simão ajuda Jesus a levar a Cruz',
        'meditation': 'Nesta quinta estação contemplemos N. S. J. C., vergado sob o peso da Cruz e atormentado com as dores da grande chaga que ela abriu em seu ombro. Mal se mexem; já não pode caminar; e os algozes, temendo que morra antes de ser crucificado, intimam Simão Cireneu a que O ajude!...',
      },
      {
        'station': 6,
        'title': 'Verónica enxuga a Face de Jesus',
        'meditation': 'Nesta sexta estação contemplemos N. S. J. C., que deixa seu retracto estampando no véu que uma caridosa mulher Lhe ofereceu, para limpar o rosto do suor e sangue que Lhe toldavam a vista!... Ó misericordiosíssimo Jesus, imprimi na nossa alma a vossa imagem, desfigurada pelos tormentos, para que nunca esqueçamos o que sofrestes por amor de nós.',
      },
      {
        'station': 7,
        'title': 'Segunda queda de Jesus',
        'meditation': 'Nesta sétima estação contemplemos N. S. J. C., exausto de forças, desfalecido e caído por terra, atordoado pela algazarra infernal da plebe, que O insulta e Lhe escarra no rosto. Os algozes, impacientes por chegarem ao Calvário, violentamente O levantam, descarregando-lhe murros e pontapés!... Ó misericordiosíssimo Jesus, não nos deixes desfalecer no vosso serviço. Conformai-nos em tudo com vossa santíssima vontade.',
      },
      {
        'station': 8,
        'title': 'Jesus conforta as mulheres de Jerusalém',
        'meditation': 'Nesta oitava estação contemplemos N. S. J. C., que esquece as suas dores para se compadecer das piedosas mulheres, que por Ele choram, e lhes diz: Filhas de Jerusalém, não choreis sobre Mim; chorai sobre vós mesmas e sobre vosso filhos!... Ó misericordiosíssimo Jesus, dai-nos lágrimas de sincero arrependimento, para chorar os nossos pecados, causa dos vossos tormentos.',
      },
      {
        'station': 9,
        'title': 'Terceira queda de Jesus',
        'meditation': 'Nesta nona estação contemplemos N. S. J. C., que chega ao Calvário, banhado em sangue, e mais morto quevivo; e, não podendo aguentar de pé os empurrões e pancadas que Lhe dão os algozes, cai desamparado e chega a tocar a terra com sua santíssima boca!... Ó misericordiosíssimo Jesus, pelas vossas chagas Vos pedimos que tenhais compaixão dos que caíram em pecado e nele vivem; salvai-nos!',
      },
      {
        'station': 10,
        'title': 'Jesus é despojado dos vestidos',
        'meditation': 'Nesta décima estação contemplemos N. S. J. C., cruelmente despojado de seus vestidos, que estavam colados às feridas, as quais novamente sangram, fazendo-o tremer com dores!... Ó misericordiosíssimo Jesus, despojai-nos do orgulho, da vaidade e dos respeitos humanos com que tanto Vos temos ofendido e atraiçoado.',
      },
      {
        'station': 11,
        'title': 'Jesus é pregado na Cruz',
        'meditation': 'Nesta estação contemplemos N. S. J. C., pregado na Cruz tão barbaramente que Lhe deslocam os ossos.',
      },
      {
        'station': 12,
        'title': 'Jesus morre na Cruz',
        'meditation': 'Nesta estação contemplemos N. S. Jesus Cristo a morrer na Cruz por amor de nós.',
      },
      {
        'station': 13,
        'title': 'Jesus é descido da Cruz',
        'meditation': 'Nesta estação contemplemos o corpo de N. S. Jesus Cristo descido da Cruz e entregue à Sua Santíssima Mãe.',
      },
      {
        'station': 14,
        'title': 'Jesus é sepultado',
        'meditation': 'Nesta estação contemplemos N. S. Jesus Cristo posto no sepulcro, e o Seu corpo santo coberto de terra.',
      },
    ],
  };

  // ORAÇÕES DO DIA
  static List<Map<String, String>> get oracoesDiarias => [
    {
      'title': 'Oração da Manhã',
      'text': 'Senhor, obrigado por este novo dia. Guia os meus passos e ajuda-me a viver para Ti. Que este dia seja dedicado à Tua glória e ao serviço do próximo. Amén.',
    },
    {
      'title': 'Oração da Noite',
      'text': 'Obrigado por este dia, Senhor. Perdoa os meus pecados e abençoa o meu sono. Protege-me durante a noite e guarda-me no teu amor. Amén.',
    },
    {
      'title': 'Ato de Contrição',
      'text': 'Meu Deus, eu me arrependo de todo o coração de Vos ter ofendido. Não Vos offensei jamais, porque Vos amo sobre todas as coisas. Firmemente propomos, com a Vossa santa graça, não Vos offender nunca mais. Amén.',
    },
    {
      'title': 'Oração a São Miguel',
      'text': 'São Miguel Arcanjo, defendedor da Igreja, protegei-nos na batalha. Dai-nos a vitória contra as potências das trevas. Rogai por nós. Amén.',
    },
    {
      'title': 'Em preparação para a confissão',
      'text': 'Senhor Jesus Cristo, Redentor do mundo, Vós que, pela vossa morte e ressurreição, reconciliastes a humanidade com o Pai, olhai para nós, pecadores, e concedei-nos a graça duma contrição perfeita. Fazei que Vos amemos de todo o nosso coração. Amén.',
    },
  ];
}
