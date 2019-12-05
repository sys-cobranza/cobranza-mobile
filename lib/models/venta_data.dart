class CobranzaData {
  CobranzaData({
    this.numDocumento = '',
    this.nombreCompleto = '',
    this.totalDeuda = 0,
    this.totalCobrado = 0,
    this.totalVenta = 0,
  });

  String numDocumento;
  String nombreCompleto;
  double totalDeuda;
  double totalCobrado;
  double totalVenta;

  static List<CobranzaData> tabIconsList = <CobranzaData>[
    CobranzaData(
      numDocumento: '45789632',
      nombreCompleto: 'Huaman Landa Chano',
      totalDeuda: 4000,
      totalCobrado: 1000,
      totalVenta: 5000,

    ),
    CobranzaData(
      numDocumento: '01457822',
      nombreCompleto: 'Ventura Navarro Emerson',
      totalDeuda: 150,
      totalCobrado: 50,
      totalVenta: 200,
    ),
    CobranzaData(
      numDocumento: '46996344',
      nombreCompleto: 'Rojas Huarhuachi Amorhin',
      totalDeuda: 0,
      totalCobrado: 420,
      totalVenta: 420,
    ),
    CobranzaData(
      numDocumento: '05879613',
      nombreCompleto: 'Enriquez Arones Mario Cesar',
      totalDeuda: 800,
      totalCobrado: 720,
      totalVenta: 1520,
    ),
  ];
}
