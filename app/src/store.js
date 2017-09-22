import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

import IRKitData from '../../.irkit.json'

export default new Vuex.Store({
  state: {
    count: 777,
    irkit: IRKitData,
  },
})
