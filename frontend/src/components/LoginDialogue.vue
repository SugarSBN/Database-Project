<!--
 * @Author: SuBonan
 * @Date: 2023-04-16 09:05:51
 * @FilePath: /Database-Project/frontend/src/components/LoginDialogue.vue
 * @Github: https://github.com/SugarSBN
 * これなに、これなに、これない、これなに、これなに、これなに、ねこ！ヾ(*´∀｀*)ﾉ
-->
<template>
    <v-dialog v-model="dialog" max-width="500px">
      <v-card>
        <v-card-title>
          <span class="text-h5">Login</span>
        </v-card-title>
  
        <v-card-text>
          <v-text-field v-model="username" label="学号"></v-text-field>
          <v-text-field v-model="password" label="密码" type="password"></v-text-field>
        </v-card-text>
  
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="primary" @click="login">登录</v-btn>
          <v-btn color="secondary" @click="cancel">取消</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
</template>

<script>
    export default {
    data() {
        return {
            dialog: false,
            username: '',
            password: ''
        };
    },
    methods: {
        login() {
            this.$emit('login', true);
        },
        cancel(){
            this.$emit('login', false);
        }
    }
    };
</script>
