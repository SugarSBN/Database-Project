/*
 * @Author: SuBonan
 * @Date: 2023-04-16 09:16:41
 * @FilePath: /Database-Project/frontend/src/store/index.js
 * @Github: https://github.com/SugarSBN
 * これなに、これなに、これない、これなに、これなに、これなに、ねこ！ヾ(*´∀｀*)ﾉ
 */
import { createStore } from "vuex";

const store = createStore({
  state: {
    name: null,
  },
  mutations: {
    login(state, user) {
      state.user = user;
    },
    logout(state) {
      state.user = null;
    },
  },
  actions: {
    login({ commit }, user) {
      commit("login", user);
    },
    logout({ commit }) {
      commit("logout");
    },
  },
  getters: {
    user: (state) => state.user,
  },
});

export default store;
