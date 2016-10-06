Ext.define('tunes.store.Tunes', {
  extend: 'Ext.data.Store',
  requires: [
    'tunes.model.Tune'
  ],
  config: {
    proxy: {
      type: 'ajax',
      url: 'data.json',
      reader: {
        type: 'json',
        rootProperty: 'data'
      },
      model: 'tunes.model.Tune'
    },
    autoLoad: true
  }
}, function () {
  fiddleStore = Ext.create('tunes.store.Tunes', {
    storeId: 'MyStore'
  });
});

