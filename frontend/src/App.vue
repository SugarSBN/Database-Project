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
        <v-row style="margin-bottom: 10px; border: 0.5px solid #6d89b2">
          <v-col cols="8" class="pa-0" style="border: 0.5px solid #6d89b2">
            <div class="overflow-auto">
              <!-- Task Table -->
              <EasyDataTable 
                      :headers="taskheaders" 
                      :items="tasks" 
                      rows-per-page="5"
                      show-index/>
            </div>
          </v-col>
          <v-col cols="4" class="pa-0" style="border: 0.5px solid #6d89b2">
            <div>
              <!-- Task content -->
              <h2 style="font-size: 15px">任务内容</h2>
              <v-textarea
                  readonly
                  :value="taskContent"
                  rows= "7"/>
            </div>
          </v-col>
        </v-row>
        <!------------------------------------------------------>
        <v-divider/>
        <v-row style="border: 0.5px solid #6d89b2">
          <!-- 常用表及视图 -->
          <v-col cols="4" class="pa-0" style="border: 0.5px solid #6d89b2">
            <div class="overflow-auto">
              <!-- Task Table -->
              <EasyDataTable 
                      :headers="tableheaders" 
                      :items="tables" 
                      rows-per-page="5"/>
            </div>
          </v-col>
          <!-- 历史sql语句 -->
          <v-col cols="4" class="pa-0" style="border: 0.5px solid #6d89b2">
            <div class="overflow-auto">
              <!-- Task Table -->
              <EasyDataTable 
                      :headers="sqlheaders" 
                      :items="sqls" 
                      rows-per-page="5"/>
            </div>
          </v-col>
          <v-col cols="3" class="pa-0" style="border: 0.5px solid #6d89b2">
            <div>
              <!-- 结果 -->
              <h2 style="font-size: 15px">运行结果</h2>
              <v-textarea
                  readonly
                  :value="result"
                  rows= "7"/>

            </div>
          </v-col>
          <v-col cols="1" class="pa-0" style="border: 0.5px solid #6d89b2">
            <!--按钮-->
            <v-btn color="#e9e7ef" width="48%" height="20%" style="margin-right: 5px; font-size: 20px">执行</v-btn>
            <v-btn color="#e9e7ef" width="48%" height="20%" style="margin-bottom: 5px; font-size: 20px">回滚</v-btn>
            <br><br/>
            <img src="./doggy.gif" alter=""/>
          </v-col>
        </v-row>

        <v-row style="border: 0.5px solid #6d89b2">
          <v-col cols="6" class="pa-0" style="border: 0.5px solid #6d89b2">
            <div>
              <!-- Table content -->
              <div class="overflow-auto">
                <header>
                  <h2 style="font-size: 15px">表信息</h2>
                </header>
                <EasyDataTable 
                        :headers="tableContentHeaders" 
                        :items="tableContents" 
                        rows-per-page="8"/>
              </div>
            </div>
          </v-col>
          <v-col cols="6" class="pa-0" style="border: 0.5px solid #6d89b2">
            <div>
              <!-- Code Editor -->
              <div class="editor-container">
                <div ref="editor" style="height: 100%"></div>
              </div>
            </div>
          </v-col>
        </v-row>
    </v-container>
  </div>
</template>

<script>
import TitleBar from "./components/TitleBar.vue";
import LoginDialog from "./components/LoginDialogue.vue";
import ace from 'ace-builds/src-noconflict/ace'

export default {
  name: "App",
  components: {
    TitleBar,
    LoginDialog
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
  mounted() {
    const editor = ace.edit(this.$refs.editor)
    editor.setTheme('ace/theme/chrome') // 设置主题
    editor.session.setMode('ace/mode/sql') // 设置语言模式
    editor.setValue('-- 请输入sql语句...') // 设置默认值
  },
  data() {
    return {
      pageTitle: "🏵️数据库实验系统",
      nameLabel: "test",
      dialog: false,
      taskContent: "这是第一行文本\n这是第二行文本\n这是第二行文本\n这是第二行文本\n这是第二行文本\n这是第二行文本\n这是第二行文本\n这是第二行文本\n这是第二行文本\n这是第二行文本\n这是第二行文本\n这是第二行文本\n这是第二行文本\n这是第二行文本",
      taskheaders: [
        { text: "任务", value: "task" },
        { text: "要求完成时间", value: "ddl", sortable: true },
        { text: "分值", value: "score", sortable: true },
        { text: "实际完成时间", value: "time", sortable: true },
        { text: "结果", value: "result", sortable: true },
        { text: "交卷验证", value: "submit", sortable: true }
      ],
      tasks: [
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
      ],
      tableheaders: [
        { text: "常用表及视图", value: "name"}
      ],
      tables : [
        {"name" : "1"},
        {"name" : "1"},
        {"name" : "1"},
        {"name" : "1"},
        {"name" : "1"},
        {"name" : "1"},
        {"name" : "1"},
        {"name" : "1"},
        {"name" : "1"},
        {"name" : "1"},
        {"name" : "1"},
        {"name" : "1"},
        {"name" : "1"},
        {"name" : "1"},
        {"name" : "1"},
        {"name" : "1"},
        {"name" : "1"},
        {"name" : "1"},
        {"name" : "1"},
        {"name" : "1"},
        {"name" : "1"},
        {"name" : "1"},
      ],

      sqlheaders: [
        { text: "历史SQL语句", value: "name"}
      ],
      sqls : [
        {"name" : "1"},
      ],

      tableContentHeaders: [
        { text: "表名", value: "name"},
        { text: "字段", value: "attribute"},
        { text: "类型", value: "type"}
      ],
      tableContents : [
        {"name" : "1", "attribute" : "2", "type" : "2"},
        {"name" : "1", "attribute" : "2", "type" : "2"},
        {"name" : "1", "attribute" : "2", "type" : "2"},
        {"name" : "1", "attribute" : "2", "type" : "2"},
        {"name" : "1", "attribute" : "2", "type" : "2"},
        {"name" : "1", "attribute" : "2", "type" : "2"},
        {"name" : "1", "attribute" : "2", "type" : "2"},
        {"name" : "1", "attribute" : "2", "type" : "2"},
        {"name" : "1", "attribute" : "2", "type" : "2"},
        {"name" : "1", "attribute" : "2", "type" : "2"},
        {"name" : "1", "attribute" : "2", "type" : "2"},
        {"name" : "1", "attribute" : "2", "type" : "2"},
        {"name" : "1", "attribute" : "2", "type" : "2"},
        {"name" : "1", "attribute" : "2", "type" : "2"},
        {"name" : "1", "attribute" : "2", "type" : "2"},
        {"name" : "1", "attribute" : "2", "type" : "2"},
        {"name" : "1", "attribute" : "2", "type" : "2"},
        {"name" : "1", "attribute" : "2", "type" : "2"},
        {"name" : "1", "attribute" : "2", "type" : "2"},
      ],
      

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
    height: 100px;
    background-color: red;
  }
  .editor-container {
    width: 100%;
    height: 400px;
  }
  #editor {
    width: 100%;
    height: 100%;
  }
</style>
