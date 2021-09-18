<template>
  <div id="Home">

    <van-nav-bar title="front page" right-text="Logout" fixed @click-right="logout" />
    <section>
      <van-grid clickable :column-num="2">
        <van-grid-item icon="bill-o" text="A la carte treasure" to="/mealOrder" />
        <van-grid-item icon="gem-o" text="Dishes management" to="/dishes/list" />
        <van-grid-item icon="apps-o" text="Classification management" to="/category" />
        <van-grid-item icon="cluster-o" text="Table number managemente number management" to="/seat" />
      </van-grid>
    </section>

  </div>
</template>
<script>
export default {
  name: "Home",
  data() {
    return {};
  },
  methods: {
    logout() {
      this.$store.dispatch("user/logout", this.loginForm).then(() => {
        this.$router.push({
          path: "/login",
        });
      });
    },
  },
};
</script>
