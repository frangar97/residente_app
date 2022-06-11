part of 'encuesta_cubit.dart';

class EncuestaState extends Equatable {
  final bool loadingEncuestas;
  final List<EncuestaModel> listaEncuestas;
  final EncuestaModel? encuestaSelected;
  final String titulo;
  final String descripcion;
  final String link;
  final String fecha;
  final FormSubmissionStatus formStatus;

  const EncuestaState({
    this.loadingEncuestas = false,
    this.listaEncuestas = const [],
    this.encuestaSelected,
    this.titulo = "",
    this.descripcion = "",
    this.fecha = "",
    this.link = "",
    this.formStatus = const InitialFormStatus(),
  });

  EncuestaState copyWith({
    bool? loadingEncuestas,
    List<EncuestaModel>? listaEncuestas,
    EncuestaModel? encuestaSelected,
    String? titulo,
    String? descripcion,
    String? link,
    String? fecha,
    FormSubmissionStatus? formStatus,
  }) {
    return EncuestaState(
        encuestaSelected: encuestaSelected ?? this.encuestaSelected,
        loadingEncuestas: loadingEncuestas ?? this.loadingEncuestas,
        listaEncuestas: listaEncuestas ?? this.listaEncuestas,
        titulo: titulo ?? this.titulo,
        descripcion: descripcion ?? this.descripcion,
        link: link ?? this.link,
        fecha: fecha ?? this.fecha,
        formStatus: formStatus ?? this.formStatus);
  }

  @override
  List<Object?> get props => [
        loadingEncuestas,
        listaEncuestas,
        encuestaSelected,
        titulo,
        descripcion,
        link,
        fecha,
        formStatus
      ];
}
