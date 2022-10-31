import 'dart:async';
import 'dart:io';
void main(List<String> args) {
  String nama;
  bool pilihanInstall;
  

  stdout.write("Masukkan pilihan [Y/t]: ");
  var pilihan = stdin.readLineSync();
  if (pilihan!.toUpperCase() == "Y") {
    process();
  } else if(pilihan.toUpperCase() == "T") {
    stderr.writeln("Instalasi dibatalkan");
    exit(1);
  }else{
    stderr.writeln("Oopsss.. anda mengetik pilihan yang salah");
    exit(1);
  }
}

process(){
List peran = [
    'PENYIHIR',
    'GUARD',
    'WEREWOLF',
  ];
  stdout.write("Masukkan nama: ");
  var nama = stdin.readLineSync();
  nama == " " ?
    stderr.write("Nama Tidak boleh kosong")
    : 
    stdout.write("Masukkan peran : ");
  var inputPeran = stdin.readLineSync();
  if (peran.contains(inputPeran!.toUpperCase())) {
    stdout.write('Nama: ${nama} \n');
    stdout.write('Peran: ${inputPeran.toUpperCase()}\n');
    hello(inputPeran.toUpperCase(),nama!);
  } else{
    stderr.write("Peran yang dimasukkan tidak sesuai\n");
    exit(1);
  }
}

hello(String peran,String nama,{test = ""}) async{
  if (peran == "PENYIHIR") {

    stdout.write('Selamat datang di dunia werewolf ${nama} \n');
    await Future.delayed(Duration(seconds: 2));
    stdout.write('Halo ${peran} ${nama}, Kamu dapat melihat siapa yang menjadi werewolf\n');
  } else if(peran == "Guard") {
    
    stdout.write('Selamat datang di dunia werewolf ${nama} \n');
    await Future.delayed(Duration(seconds: 2));
    stdout.write('Halo ${peran} ${nama}, Kamu akan membantu temanmu dari serangan werewolf\n');
  }else{

    stdout.write('Selamat datang di dunia werewolf ${nama} \n');
    await Future.delayed(Duration(seconds: 2));
    stdout.write('Halo ${peran} ${nama}, Kamu dapat memakan mangsa setiap malam\n');
  }
}