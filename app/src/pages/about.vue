<template lang="pug">
  f7-page
    f7-navbar(title="About" back-link="Back" sliding)
    f7-block(inner)
      div(v-for='k in signals')
        h1(@click='send(k)') {{ k }}
</template>

<script>
export default {
  computed: {
    count () {
      return this.$store.state.count
    },
    signals () {
      return Object.keys(this.$store.state.irkit.IR)
    },
  },
  mounted: () => {
    console.log('mounted')
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
