part of 'comunicado_cubit.dart';

class ComunicadoState extends Equatable {
  final bool loadingComunicados;
  final List<ComunicadoModel> listaComunicados;
  final ComunicadoModel? comunicadoSelected;
  final String titulo;
  final String descripcion;
  final String fecha;
  final FormSubmissionStatus formStatus;

  const ComunicadoState(
      {this.loadingComunicados = false,
      this.listaComunicados = const [],
      this.comunicadoSelected,
      this.titulo = "",
      this.descripcion = "",
      this.fecha = "",
      this.formStatus = const InitialFormStatus()});

  ComunicadoState copyWith({
    bool? loadingComunicados,
    List<ComunicadoModel>? listaComunicados,
    ComunicadoModel? comunicadoSelected,
    String? titulo,
    String? descripcion,
    String? fecha,
    FormSubmissionStatus? formStatus,
  }) {
    return ComunicadoState(
      comunicadoSelected: comunicadoSelected ?? this.comunicadoSelected,
      loadingComunicados: loadingComunicados ?? this.loadingComunicados,
      listaComunicados: listaComunicados ?? this.listaComunicados,
      titulo: titulo ?? this.titulo,
      descripcion: descripcion ?? this.descripcion,
      fecha: fecha ?? this.fecha,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  @override
  List<Object?> get props => [
        loadingComunicados,
        listaComunicados,
        comunicadoSelected,
        titulo,
        descripcion,
        fecha,
        formStatus
      ];
}
