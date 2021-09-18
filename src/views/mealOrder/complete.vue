<template>
  <div id="">
    <van-nav-bar title="successfully ordered" fixed left-arrow @click-left="$router.push('/mealOrder')" />
    <section>

      <div class="order">
        <div class="hd">
          <van-divider>order information</van-divider>
          <van-icon name="smile-o" size="20" color="#f60" />
          <span>Order number:{{orderData.order_number}}</span>
          <span>Meal time:{{orderData.repast_date}}{{orderData.repast_time}}</span>
          <span>Remarks information:{{orderData.remark}}</span>
        </div>
        <div class="bd">
          <van-divider>Ordered</van-divider>
          <div class="goods">
            <div class="item" v-for="(e,i) in orderData.dishes" :key="i">
              <div class="hd">
                <img :src="e.url" alt="">
              </div>
              <div class="bd">
                <strong>{{e.name}}</strong>
                <span>{{e.price}}</span>
              </div>
              <div class="ft">
                {{e.order_dishes.dishes_num}}/share
              </div>
            </div>
          </div>
        </div>
        <div class="ft">
          <span>Total Amount:<em>{{total}}</em><small>Yuan</small></span>
        </div>
      </div>
    </section>
    <footer>
      <button class="van-button--primary" @click="$router.push('/mealOrder')">Continue to order</button>
    </footer>
  </div>
</template>

<script>
import { getOrderBySeatOn } from "@/api/order";
export default {
  name: "",
  data() {
    return {
      orderData: {},
      total: 0,
    };
  },
  created() {
    this.onLoad();
  },
  methods: {
    async onLoad() {
      let seat_no = this.$route.query.seat_no;
      const { data } = await getOrderBySeatOn(seat_no);
      this.orderData = data;
      data.dishes.forEach((e) => {
        this.total += e.subtotal;
      });
    },
  },
};
</script>
<style lang="scss" scoped>
section {
  margin-bottom: 44px;
}
</style>
