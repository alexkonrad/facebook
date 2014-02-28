Facebook.Models.Photo = Backbone.Model.extend({
  parse: function (resp) {
    resp.user = new Facebook.Models.User(resp["user"]);
    resp.comments = new Facebook.Collections.Comments(resp["comments"], {
      photo: this
    });

    return resp;
  },

  urlRoot: "/photos",

  toJSON: function () {
    var data = { "photo" : { "filename" : this.get('filename') } };

    return data;
  }
})