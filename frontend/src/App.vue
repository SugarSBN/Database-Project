<!--
 * @Author: SuBonan
 * @Date: 2023-04-15 10:21:11
 * @FilePath: /Database-Project/frontend/src/App.vue
 * @Github: https://github.com/SugarSBN
 * これなに、これなに、これない、これなに、これなに、これなに、ねこ！ヾ(*´∀｀*)ﾉ
-->
// "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" –disable-web-security --user-data-dir=C:\Program Files (x86)\Microsoft\Temp
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
                      :headers="taskHeader" 
                      :items="taskInfo" 
                      @click-row="handleTaskTableRowClick"
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
              <EasyDataTable 
                      :headers="tableHeader" 
                      :items="tableInfo" 
                      @click-row="handleTableViewRowClick"
                      rows-per-page="5"/>
            </div>
          </v-col>
          <!-- 历史sql语句 -->
          <v-col cols="3" class="pa-0" style="border: 0.5px solid #6d89b2">
            <div class="overflow-auto">
              <EasyDataTable 
                      :headers="sqlHeader" 
                      :items="sqlInfo" 
                      rows-per-page="5"/>
            </div>
          </v-col>
          <v-col cols="3" class="pa-0" style="border: 0.5px solid #6d89b2">
            <div>
              <!-- 结果 -->
              <h2 style="font-size: 15px">运行结果</h2>
              <v-textarea
                  readonly
                  :value="executionResult"
                  :style="textareaStyle"
                  rows= "7"/>

            </div>
          </v-col>
          <v-col cols="2" class="pa-0" style="border: 0.5px solid #6d89b2">
            <!--按钮-->
            <v-btn color="#e9e7ef" width="48%" height="20%" style="margin-right: 5px; font-size: 20px" @click="executeSQL">执行</v-btn>
            <v-btn color="#e9e7ef" width="48%" height="20%" style="margin-bottom: 5px; font-size: 20px" @click="checkAnswer">提交</v-btn>
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
                  <h2 style="font-size: 15px">表内容</h2>
                </header>
                <EasyDataTable 
                        :headers="tableContentHeader" 
                        :items="tableContentInfo" 
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
import axios from 'axios'

export default {
  name: "App",
  components: {
    TitleBar,
    LoginDialog
  },
  methods: {
    // 执行SQL语句
    executeSQL(){
      const editor = ace.edit(this.$refs.editor)
      const sql = editor.getValue()
      var parameter = {
        name : this.$store.state.user,
        sql: sql
      }
      axios({
        url: 'http://8.130.116.40:9080/submit/submit',
        method: 'post',
        data: JSON.stringify(parameter),
        headers: {
          'Content-Type': 'application/json'
        },
      }).then(response =>{
        const data = response.data
        if (data['error'] == null) {
          if (data['results'] instanceof Array){
            var jsons = data['results'][0];
            var header = [];
            for (let key in jsons){
              header.push({text : key, value : key});
            }
            this.tableContentHeader = header;
            this.tableContentInfo = data['results'];
          }
          this.executionResult = "执行成功！";
          this.textareaStyle = {color : "#00ff00" };
        } else {
          this.executionResult = data['error']['sqlMessage'];
          this.textareaStyle = {color : "#ff0000" };
        }

        this.refreshHistory();
        this.refreshTables();
      }).catch(error => {
        console.log(error)
      })
    },
    // 刷新历史SQL语句
    refreshHistory(){
      var parameter = {
        name : this.$store.state.user
      }
      axios({
        url: 'http://8.130.116.40:9080/info/getallhis',
        method: 'post',
        data: JSON.stringify(parameter),
        headers: {
          'Content-Type': 'application/json'
        },
      }).then(response =>{
        const data = response.data['list']
        var tmp = [];
        for (let i = data.length - 1;i >= 0;i--){
          if (data[i]['text'] != 'Show Tables;;;;;;;;;'){
            tmp.push({text: data[i]['text']});
          }
        }
        this.sqlInfo = tmp;
      }).catch(error => {
        console.log(error)
      })
    },
    
    // 打开登录界面
    openLoginDialogue() {
      this.dialog = true;
    },

    // 登录见面点击登录按钮
    handleLogin(username, password){
      this.dialog = false;
      var parameter = {
        name : username,
        password : password
      }
      axios({
        url: 'http://8.130.116.40:9080/user/login',
        method: 'post',
        data: JSON.stringify(parameter),
        headers: {
          'Content-Type': 'application/json'
        },
      }).then(response =>{
        alert(response.data['message']);
        if (response.data['message'] == '登录成功') {
          this.nameLabel = username;
          this.$store.commit("login", username); 
          this.refreshTaskTable();
          this.refreshTables();
          this.refreshHistory();
        }
      })
      // this.$store.commit("login", user);
      // console.log(this.$store.state.user);
    },
    checkAnswer(){
      var parameter = {
        name : this.$store.state.user,
        proidnumber : this.$store.state.proid
      }

      console.log(parameter)
      
      axios({
        url: 'http://8.130.116.40:9080/submit/check',
        method: 'post',
        data: JSON.stringify(parameter),
        headers: {
          'Content-Type': 'application/json'
        },
      }).then(response =>{
        const data = response.data
        console.log(data);
        if (data['error'] == 1){
          this.refreshTaskTable(true, true);
        } else {
          this.refreshTaskTable(true, false);
        }
        if (data['error'] == 1) {
            this.textareaStyle = {color : "#ff0000" };
          this.executionResult = data['message'];
        }
      })
    },
    refreshTables(){
      var parameter = {
        name : this.$store.state.user,
        sql: "Show Tables;;;;;;;;;"
      }
      axios({
        url: 'http://8.130.116.40:9080/submit/submit',
        method: 'post',
        data: JSON.stringify(parameter),
        headers: {
          'Content-Type': 'application/json'
        },
      }).then(response =>{
        const data = response.data['results']
        console.log(data)
        var key = Object.keys(data[0])[0]
        var tmp = [];
        for (let i = 0;i < data.length;i++){
          tmp.push({name : data[i][key]});
        }
        console.log(tmp)
        this.tableInfo = tmp;

      }).catch(error => {
        console.log(error)
      })
    },
    
    refreshTaskTable(rua = false, ruaa = false){
      var parameter = {
        name : this.$store.state.user
      }
      axios({
        url: 'http://8.130.116.40:9080/info/getallstate',
        method: 'post',
        data: JSON.stringify(parameter),
        headers: {
          'Content-Type': 'application/json'
        },
      }).then(response =>{
        var taskTables = response.data['list'];
        var tmp = [];
        for (let i = 0;i < taskTables.length;i++){
          var state = "";
          if (taskTables[i]['state_type'] == 0) state = "未完成";
          if (taskTables[i]['state_type'] == 1) state = "答案错误";
          if (taskTables[i]['state_type'] == 2) state = "答案正确";
          if (taskTables[i]['state_type'] == 3) state = "已过期";
          tmp.push({
            task: taskTables[i]['pro_name'],
            ddl: taskTables[i]['state_finishtime'],
            result: state,
            submit: ""
          });
          if (!ruaa && rua && taskTables[i]['pro_id'] == this.$store.state.proid) {
            this.textareaStyle = {color : "#00ff00" };
            this.executionResult = state;
          }
        }
        console.log(taskTables);
        this.taskInfo = tmp;
      })
    },

    handleTaskTableRowClick(rowData){
      var pro_name = rowData['task'];
      var parameter = {
        name : this.$store.state.user
      }
      axios({
        url: 'http://8.130.116.40:9080/info/getallstate',
        method: 'post',
        data: JSON.stringify(parameter),
        headers: {
          'Content-Type': 'application/json'
        },
      }).then(response =>{
        var taskTables = response.data['list'];
        for (let i = 0;i < taskTables.length;i++){
          if (taskTables[i]['pro_name'] == pro_name){
            this.taskContent = taskTables[i]['pro_text'];
            this.$store.commit("selectTask", taskTables[i]['pro_id'])
            break;
          }
        }
      })
    },

    handleTableViewRowClick(rowData){
      var parameter = {
        name : this.$store.state.user,
        tablename : "`" + rowData['name'] + "`"
      }
      axios({
        url: 'http://8.130.116.40:9080/info/gettable',
        method: 'post',
        data: JSON.stringify(parameter),
        headers: {
          'Content-Type': 'application/json'
        },
      }).then(response =>{
        var data = response.data['results'];
        if (data.length != 0){
          var tmp =[];
          for (let key in data[0]){
            tmp.push({text : key, value : key});
          }
          console.log(tmp);
          this.tableContentHeader = tmp;
          tmp = [];
          for (let i = 0;i < data.length;i++){
            tmp.push(data[i]);
          }
          this.tableContentInfo = tmp;
        } else {
          var fields = response.data['fields'];
          tmp = [];
          for (let i = 0;i < fields.length;i++){
            tmp.push({text : fields[i]['name'], value : fields[i]['name']});
          }
          this.tableContentHeader = tmp;
          this.tableContentInfo = [];
        }
      })
    },

    // 登出按钮
    logout(){
      this.$store.commit("logout");
      this.taskContent = "";
      
      this.taskInfo = [];
      this.tableInfo = [];
      
      this.tableContentHeader = [];
      this.tableContentInfo = [];

      this.sqlInfo = [];

      this.executionResult = "";
      
      ace.edit(this.$refs.editor).setValue('-- 请输入sql语句...');

      this.nameLabel = "未登入"
    },

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
      nameLabel: "未登入",
      dialog: false,
      taskContent: "",
      executionResult : "",
      taskHeader: [
        { text: "任务", value: "task" },
        { text: "要求完成时间", value: "ddl", sortable: true },
        { text: "结果", value: "result", sortable: true }
      ],
      taskInfo: [
      ],
      tableHeader: [
        { text: "常用表及视图", value: "name"}
      ],
      tableInfo : [
      ],

      sqlHeader: [
        { text: "历史SQL语句", value: "text"}
      ],
      sqlInfo : [
        {text : "1"},
      ],

      tableContentHeader : [
      ],
      tableContentInfo : [
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
