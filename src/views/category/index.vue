<template>
  <div id="">
    <van-nav-bar title="manage" left-text="return" right-text="New" left-arrow fixed @click-left="$router.back(-1)" @click-right="addHandle" />

    <van-list>
      <van-swipe-cell :before-close="beforeClose" :index="index" :id="item.id" v-for="(item,index) in items" :key="index">
        <van-cell :border="false" :title="item.name" :value="item.status == 1 ? 'Enable' : 'Disable'" @click="updateHandle(item)" />
        <template #right>
          <van-button square type="danger" text="delete" />
        </template>
      </van-swipe-cell>
    </van-list>

    <van-popup v-model="addPopup" position="right" :style="{ width: '100%' , height: '100%'}">
      <van-nav-bar title="New" left-text="return" right-text="submit" left-arrow @click-left="addPopup = false" @click-right="addData" />

      <van-form>

        <van-field v-model="formData.name" name="name" label="name" :rules="[{ required: true, message: 'Please enter a name' }]" />

        <van-field name="stepper" label="Sort">
          <template #input>
            <van-stepper v-model="formData.sort" />
          </template>
        </van-field>

        <van-field name="switch" label="Enable">
          <template #input>
            <van-switch v-model="switchChecked" size="20" />
          </template>
        </van-field>

      </van-form>

    </van-popup>

    <van-popup v-model="updatePopup" position="right" :style="{ width: '100%' , height: '100%'}">
      <van-nav-bar title="edit" left-text="return" right-text="submit" left-arrow @click-left="updatePopup = false" @click-right="updateData" />
      <van-form>

        <van-field v-model="formData.name" name="name" label="name" :rules="[{ required: true, message: 'Please enter a name' }]" />

        <van-field name="stepper" label="Sort">
          <template #input>
            <van-stepper v-model="formData.sort" />
          </template>
        </van-field>

        <van-field name="switch" label="Enable">
          <template #input>
            <van-switch v-model="switchChecked" size="20" />
          </template>
        </van-field>

      </van-form>
    </van-popup>

  </div>
</template>

<script>
import {
  getCategorys,
  addCategory,
  updateCategory,
  deleteCategory,
} from "@/api/category";
export default {
  name: "",
  data() {
    return {
      items: [],
      formData: {},
      addPopup: false,
      updatePopup: false,
      switchChecked: true,
    };
  },
  created() {
    this.getData();
  },
  methods: {
    async getData() {
      const { data } = await getCategorys(0);
      this.items = data;
    },

    async addData() {
      if (this.switchChecked) {
        this.formData.status = 1;
      } else {
        this.formData.status = 0;
      }
      try {
        await addCategory(this.formData);
        this.$toast("Created successfully");
        this.addPopup = false;
        this.reset();
      } catch (error) {
        this.$toast("Creation failed" + error);
      }
    },
    async updateData() {
      if (this.switchChecked) {
        this.formData.status = 1;
      } else {
        this.formData.status = 0;
      }
      try {
        await updateCategory(this.formData);
        this.$toast("update completed");
        this.updatePopup = false;
        this.reset();
      } catch (error) {
        this.$toast("Update failed" + error);
      }
    },
    async deleteData(index, id) {
      try {
        await deleteCategory(id);
        this.items.splice(index, 1);
      } catch (error) {
        alert(error);
      }
    },
    reset() {
      this.switchChecked = true;
      this.formData = {};
      this.getData();
    },
    addHandle() {
      this.reset();
      this.addPopup = true;
    },
    updateHandle(item) {
      if (item.status == 1) {
        this.switchChecked = true;
      } else {
        this.switchChecked = false;
      }
      this.updatePopup = true;
      this.formData = item;
    },

    beforeClose({ position, instance }) {
      switch (position) {
        case "outside":
          instance.close();
          break;
        case "right":
          this.deleteData(instance.$attrs.index, instance.$attrs.id);
          instance.close();
          break;
      }
    },
  },
};
</script>
<style lang="scss" scoped>
.van-list {
  margin-top: 46px;
  .van-swipe-cell {
    border-bottom: 1px solid #f5f5f5;
  }
}
</style>