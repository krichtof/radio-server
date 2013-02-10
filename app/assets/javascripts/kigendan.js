window.Kigendan = {
    Models: {},
    Collections: {},
    Views: {},
    Routers: {},
    initialize: function() {
        var tracks = new Kigendan.Collections.Tracks();
        var tracksView = new Kigendan.Views.TracksIndex({ collection: tracks });
        tracks.fetch();

        var uploader = new Kigendan.Views.TrackUploader();

        var playlists = new Kigendan.Collections.Playlists();
        var playlistsView = new Kigendan.Views.PlaylistsIndex({ collection: playlists });
        playlists.fetch();

        globalPlaylist = new Kigendan.Models.Playlist();
        var globalPlaylistView = new Kigendan.Views.ExtendedPlaylist({ model: globalPlaylist });
        
        var tracksSearch = new Kigendan.Views.TracksSearch();
    }
};

$(document).ready(function(){
    Kigendan.initialize();
});
