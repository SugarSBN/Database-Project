<template>
    <div class="titlebar">
      <span class="title">{{ title }}</span>
      <slot name="left"></slot>
      <div class="right">
        <slot name="right"></slot>
      </div>
    </div>
</template>

<script>
    export default {
        name: "TitleBar",
        props: {
            title: {
                type: String,
                default: "",
            },
        },
    };
</script>

<style scoped>
    .titlebar {
        height: 50px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: #6d89b2;
        color: #fff;
        padding: 0 10px;
    }

    .title {
        font-size: 18px;
        font-weight: bold;
    }

    .right {
        display: flex;
        align-items: center;
    }
</style>
