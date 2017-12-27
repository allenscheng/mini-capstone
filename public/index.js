/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
      products: [],
      nameFilter: ""
    };
  },
  mounted: function() {
    axios.get("/v1/clothes").then(
      function(response) {
        this.products = response.data;
      }.bind(this)
    );
  },
  methods: {
    isValid: function(inputProduct) {
      var validName = inputProduct.name
        .toLowerCase()
        .includes(this.nameFilter.toLowerCase());
      return validName;
    }
  },
  computed: {}
};

var SamplePage = {
  template: "#sample-page",
  data: function() {
    return {
      message: "Welcome to a sample page!"
    };
  },
  mounted: function() {},
  methods: {},
  computed: {}
};

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/v1/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  mounted: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

var NewItemPage = {
  template: "#new-item-page",
  data: function() {
    return {
      name: "",
      length: "",
      color: "",
      price: "",
      image: "",
      description: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        length: this.length,
        color: this.color,
        price: this.price,
        // image: this.image,
        description: this.description
      };
      axios
        .post("/v1/clothes", params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
            router.push("/login");
          }.bind(this)
        );
    }
  }
};

var UpdateItemPage = {
  template: "#update-item-page",
  data: function() {
    return {
      name: "",
      length: "",
      color: "",
      price: "",
      image: "",
      description: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        length: this.length,
        color: this.color,
        price: this.price,
        // image: this.image,
        description: this.description
      };
      axios
        .patch("/v1/clothes/" + this.$route.params.id, params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
            router.push("/login");
          }.bind(this)
        );
    }
  }
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/clothes/new", component: NewItemPage },
    { path: "/clothes/:id", component: UpdateItemPage },
    { path: "/sample", component: SamplePage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/logout", component: LogoutPage }
  ]
});

var app = new Vue({
  el: "#app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});
