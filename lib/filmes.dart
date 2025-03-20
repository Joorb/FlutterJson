class Filmes {
  late String titulo;
  late int ano;
  late String descricao;

  Filmes()
  {
    titulo = "";
    ano = 0;
    descricao = "";
  }

Filmes.v(this.titulo, this.ano, this.descricao);




Filmes.fromJson(Map<String, dynamic> json)
  : titulo = json['title'] as String,
    ano = json['year'] as int,
    descricao = json['text'] as String;


  Map<String, dynamic> toJson() => {
    'title': titulo,
    'year': ano,
    'text': descricao,
    };
}
