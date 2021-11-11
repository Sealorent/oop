import 'dart:io';

class Users {
  late String name;
  late int norek;
  late int pin;
  late int balance;

  // konstruktor model atau kelas pengguna, untuk mendapatkan nilai dari luar kelas
  Users(
    this.name,
    this.pin,
    this.norek,
    this.balance,
  );
}

Users _user = Users(
  '',
  0,
  0,
  0,
);

void main() {
  print('\nSelamat Datang di ATM7');
  print('1 = Daftar ATM');
  print('2 = Masuk ATM');
  stdout.write('Pilih Menu : ');
  var menu = stdin.readLineSync();
  switch (menu) {
    case '1':
      daftarAkun();
      break;
    case '2':
      masukAtm();
      break;
    default:
      exit(0);
  }
  main();
}

void daftarAkun() {
  stdout.write("Nama Anda:\n");
  _user.name = stdin.readLineSync().toString();
  stdout.write("PIN anda :\n");
  _user.pin = int.parse(stdin.readLineSync().toString());
  stdout.write("No Rekening:\n");
  _user.norek = int.parse(stdin.readLineSync().toString());
  stdout.write("isi saldo (minimal 50000) :\n");
  _user.balance = int.parse(stdin.readLineSync().toString());
}

void masukAtm() {
  stdout.write('\nMasukan PIN Anda : ');
  var pin = int.tryParse(stdin.readLineSync() ?? '');
  if (_user.pin == pin) {
    print('1 = Info Rekening');
    print('2 = Simpan');
    print('3 = Ambil');
    print('4 = exit');
    stdout.write('+++++++++++++++++++++++ Pilih Menu +++++++++++++++++++++\n');
    var menudua = stdin.readLineSync();
    switch (menudua) {
      case '1':
        infoRekening();
        break;
      case '2':
        simpan();
        break;
      case '3':
        ambil();
        break;
      case '4':
      default:
        exit(0);
    }
    masukAtm();
  } else {
    print("PIN yang Anda masukkan salah!");
  }
}

void infoRekening() {
  print("atas nama  " + _user.name);
  print("jumlah saldo  " + _user.balance.toString());
  print("Nomer Rekening  " + _user.norek.toString());
  stdout.write('\nkembali (y/n)');
  var kon = stdin.readLineSync();
  if (kon == 'y') {
    masukAtm();
  } else {
    exit(0);
  }
}

void simpan() {
  stdout.write('\nNominal Setoran : Rp ');
  var amount = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  _user.balance = amount + _user.balance;
  stdout.write('\nkembali (y/n)');
  var kon = stdin.readLineSync();
  if (kon == 'y') {
    masukAtm();
  } else {
    exit(0);
  }
}

void ambil() {
  stdout.write('\nNominal Penarikan : Rp ');
  var amount = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  if (amount > (_user.balance)) {
    print('\nSaldo Anda tidak mencukupi');
    return;
  }
  _user.balance = _user.balance - amount;
  stdout.write('\nkembali (y/n)');
  var kon = stdin.readLineSync();
  if (kon == 'y') {
    masukAtm();
  } else {
    exit(0);
  }
}
