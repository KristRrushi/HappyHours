
String dayParser(DateTime date) {
  switch (date.weekday) {
    case 1:
      {
        return 'Hene';
      }
      break;
    case 2:
      {
        return 'Marte';
      }
      break;
    case 3:
      {
        return 'Merkure';
      }
      break;
    case 4:
      {
        return 'Enjte';
      }
      break;
    case 5:
      {
        return 'Premte';
      }
      break;
    case 6:
      {
        return 'Shtune';
      }
      break;
    case 7:
      {
        return 'Diele';
      }
      break;
  }
}

String monthParser(DateTime date) {
  String day = date.day.toString();
  switch (date.month) {
    case 1:
      {
        return '$day janar';
      }
      break;
    case 2:
      {
        return '$day shkurt';
      }
      break;
    case 3:
      {
        return '$day mars';
      }
      break;
    case 4:
      {
        return '$day prill';
      }
      break;
    case 5:
      {
        return '$day maj';
      }
      break;
    case 6:
      {
        return '$day qershor';
      }
      break;
    case 7:
      {
        return '$day korrik';
      }
      break;
    case 8:
      {
        return '$day gusht';
      }
      break;
    case 9:
      {
        return '$day shtator';
      }
      break;
    case 10:
      {
        return '$day tetor';
      }
      break;
    case 11:
      {
        return '$day nentor';
      }
      break;
    case 12:
      {
        return '$day dhjetor';
      }
      break;
  }
}