Map<int, String> migrationScriptsCars = {
  1: '''
      CREATE TABLE cars(
        id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        marcas TEXT,
        modelos TEXT,
        anoModelo INTEGER,
        valor TEXT,
        combustivel TEXT
        createAt TEXT,
        updateAt TEXT
      )
    ''',
};
