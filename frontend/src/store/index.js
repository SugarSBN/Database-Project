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
    user: null,
    proid: 0,
  },
  mutations: {
    login(state, user) {
      state.user = user;
    },
    logout(state) {
      state.user = null;
    },
    selectTask(state, task) {
      state.proid = task;
    }
  },
  actions: {
    login({ commit }, user) {
      commit("login", user);
    },
    selectTask({ commit }, task) {
      commit("selectTask", task);
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
