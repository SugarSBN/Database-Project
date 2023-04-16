/*
 * @Author: SuBonan
 * @Date: 2023-04-15 10:21:11
 * @FilePath: /Database-Project/frontend/src/main.js
 * @Github: https://github.com/SugarSBN
 * これなに、これなに、これない、これなに、これなに、これなに、ねこ！ヾ(*´∀｀*)ﾉ
 */
import 'vuetify/styles'
import { createApp } from 'vue'
import { createVuetify } from 'vuetify'
import App from './App.vue'
import store from "./store";

import * as components from 'vuetify/components'
import * as directives from 'vuetify/directives'
import Vue3EasyDataTable from 'vue3-easy-data-table';
import 'vue3-easy-data-table/dist/style.css';

const app = createApp(App)
const vuetify = createVuetify({
  components,
  directives
})

app.use(vuetify)
app.use(store)
app.component('EasyDataTable', Vue3EasyDataTable)

app.mount('#app')