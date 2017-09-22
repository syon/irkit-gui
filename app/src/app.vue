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
          f7-block-title Switches
          f7-list
            template(v-for='k in signals')
              f7-list-button(@click='send(k)') {{ k }}
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

<style>
.list-block .list-button {
  text-align: left;
}
</style>
