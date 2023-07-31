Map<int, String> migrationScriptsCars = {
  1: '''
      CREATE TABLE cars(
        id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        marca TEXT,
        modelo TEXT,
        ano INTEGER,
        valor TEXT,
        combustivel TEXT
      )
    ''',
};
