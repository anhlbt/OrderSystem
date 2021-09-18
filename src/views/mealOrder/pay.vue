<template>
  <div id="">
    <van-nav-bar title="Scan QR code to pay QR code to pay" fixed left-arrow @click-left="$router.push('/mealOrder')" />
    <section>

      <div class="paybody">
        <van-divider>scan it</van-divider>
        <div class="qrcode">
          <img src="@/assets/images/qrcode.png" alt="">
        </div>
        <van-divider>order information</van-divider>
        <span>Order number:{{orderData.order_number}}</span>
        <span>Meal time:{{orderData.repast_date}}{{orderData.repast_time}}</span>
        <span>order amount:{{total}}元</span>
      </div>

    </section>
    <footer>
      <button class="van-button--primary" @click="succees">Simulation success callback</button>
      <button class="van-button--info" @click="fail">Simulation failure callback</button>
    </footer>
  </div>
</template>

<script>
import { updateSeat } from "@/api/seat";
import { getOrderBySeatOn, updateOrder } from "@/api/order";
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
    async succees() {
      //改变订单状态 和 桌号状态
      try {
        await updateOrder({
          id: this.orderData.id,
          status: 2,
        });
        await updateSeat({
          id: this.orderData.seat_no,
          status: 1,
        });
        this.$toast("Callback succeeded");
        this.$router.push('/mealOrder')
      } catch (error) {
        this.$toast("Callback failed");
      }
    },
    fail() {},
  },
};
</script>
<style lang="scss" scoped>
section {
  margin-bottom: 44px;
}
.paybody {
  img {
    margin: 30px auto;
    width: 240px;
    display: block;
  }
  span {
    display: block;
    padding: 5px 20px;
  }
}
</style>
