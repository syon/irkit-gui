import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

import IRKitData from '../../irkit-data/.irkit.json'

export default new Vuex.Store({
  state: {
    count: 777,
    irkit: IRKitData,
  },
})
