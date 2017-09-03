<template lang="pug">
#app
  f7-statusbar
  f7-views
    f7-view(id="main-view" navbar-through :dynamic-navbar="true" main)

      // iOS Theme Navbar
      f7-navbar(v-if="$theme.ios")
        f7-nav-center(sliding) IRKit GUI

      f7-pages
        f7-page
          f7-block-title Welcome to my App
          f7-block(inner)
            p Duis sed erat ac eros ultrices pharetra id ut tellus. Praesent rhoncus enim ornare ipsum aliquet ultricies. Pellentesque sodales erat quis elementum sagittis.
          f7-block-title Navigation
          f7-list
            template(v-for='k in signals')
              f7-list-item(@click='send(k)' :title="k")
</template>

<script>
export default {
  computed: {
    signals () {
      return Object.keys(this.$store.state.irkit.IR)
    },
  },
  methods: {
    send: function (key) {
      fetch('/send', {
        method: 'POST',
        headers: {
          Accept: 'application/json',
          'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        },
        body: `key=${key}`
      })
        .then((res) => { return res.text() })
        .then((res) => { console.log('success:', res) })
    },
  },
}
</script>
