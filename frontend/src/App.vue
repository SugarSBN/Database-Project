<!--
 * @Author: SuBonan
 * @Date: 2023-04-15 10:21:11
 * @FilePath: /Database-Project/frontend/src/App.vue
 * @Github: https://github.com/SugarSBN
 * これなに、これなに、これない、これなに、これなに、これなに、ねこ！ヾ(*´∀｀*)ﾉ
-->
<template>
  <div id="app">
    <TitleBar :title="pageTitle">
      <template #right>
        <v-label>{{ nameLabel }}</v-label>
        <span>&nbsp;&nbsp;</span>
        <v-btn @click="openLoginDialogue">登录</v-btn>
        <span>&nbsp;</span>
        <v-btn @click="logout">登出</v-btn>
      </template>
    </TitleBar>
    <v-container>
      <LoginDialog v-model="dialog" @login="handleLogin"/>
    </v-container>
    <v-container fluid>
        <v-row>
          <v-col cols="8">
            <div class="overflow-auto">
              <!-- Task Table -->
              <EasyDataTable 
                      :headers="headers" 
                      :items="items" 
                      rowsPerPage="5"
                      show-index/>
            </div>
          </v-col>
          <v-col cols="4">
            <div>
              <!-- Task content -->
              <v-textarea
                  readonly
                  :value="taskContent"
                  rows= "9"/>
            </div>
          </v-col>
        </v-row>
        <!------------------------------------------------------>
        <v-divider class="myDivider"></v-divider>

        <v-row>
          <v-col cols="8">
            <div class="overflow-auto">
              <!-- Task Table -->
              <EasyDataTable 
                      :headers="headers" 
                      :items="items" 
                      rowsPerPage="5"
                      show-index/>
            </div>
          </v-col>
          <v-col cols="4">
            <div>
              <!-- Task content -->
              <v-textarea
                  readonly
                  :value="taskContent"
                  style="height: 400px  overflow-y: auto"/>
            </div>
          </v-col>
        </v-row>
    </v-container>
  </div>
</template>

<script>
import TitleBar from "./components/TitleBar.vue";
import LoginDialog from "./components/LoginDialogue.vue";

export default {
  name: "App",
  components: {
    TitleBar,
    LoginDialog,
  },
  methods: {
    openLoginDialogue() {
      this.dialog = true;
    },
    handleLogin(success){
      console.log(success);
      this.dialog = false;
      const user = { name: "Jack", age: 18 };
      this.$store.commit("login", user);
      console.log(this.$store.state.user);
    },
    logout(){
      this.$store.commit("logout");
    }
  },
  data() {
    return {
      pageTitle: "🏵️数据库实验系统",
      nameLabel: "test",
      dialog: false,
      taskContent: "这是第一行文本\n这是第二行文本\n这是第二行文本\n这是第二行文本\n这是第二行文本\n这是第二行文本\n这是第二行文本\n这是第二行文本\n这是第二行文本\n这是第二行文本\n这是第二行文本\n这是第二行文本\n这是第二行文本\n这是第二行文本",
      headers: [
        { text: "任务", value: "task" },
        { text: "要求完成时间", value: "ddl", sortable: true },
        { text: "分值", value: "score", sortable: true },
        { text: "实际完成时间", value: "time", sortable: true },
        { text: "结果", value: "result", sortable: true },
        { text: "交卷验证", value: "submit", sortable: true }
      ],
      items: [
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
        { "task" : "1", "ddl" : "2", "score" : "3", "time" : "4", "result" : "5", "submit" : "6"},
      ]
    };
  },
};
</script>

<style>
  #app {
    font-family: Avenir, Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    width : 100%;
    height : 100%;
  }
  .overflow-auto {
    overflow-x: auto;
    max-width: 100%;
  }
  .myDivider {
    width: 100%;
    height: 4px;
    background-color: red;
  }
</style>
