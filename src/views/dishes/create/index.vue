<template>
  <div>

    <van-nav-bar
      :title="title"
      left-text="return"
      right-text="submit"
      left-arrow
      fixed
      @click-left="$router.back(-1)"
      @click-right="save"
    />

    <van-form>
      <van-field
        v-model="formData.name"
        name="name"
        label="name"
        :rules="[{ required: true, message: 'Please enter the name of the dish' }]"
      />

      <van-field
        v-model="formData.price"
        name="price"
        label="price"
        :rules="[{ required: true, message: 'Please enter the price of the dish' }]"
      />

      <van-field
        name="stepper"
        label="Sort"
      >
        <template #input>
          <van-stepper v-model="formData.sort" />
        </template>
      </van-field>

      <van-field
        readonly
        clickable
        name="picker"
        :value="categoryName"
        label="Classification"
        placeholder="Click to select category"
        @click="showPicker = true"
      />
      <van-popup
        v-model="showPicker"
        position="bottom"
      >
        <van-picker
          show-toolbar
          :columns="categoryNames"
          :default-index="defaultIndex"
          @confirm="onCategoryConfirm"
          @cancel="showPicker = false"
        />
      </van-popup>

      <van-field
        name="switch"
        label="Enable"
      >
        <template #input>
          <van-switch
            v-model="switchChecked"
            size="20"
          />
        </template>
      </van-field>

      <van-field
        v-model="formData.desc"
        rows="3"
        autosize
        label="describe"
        type="textarea"
        maxlength="500"
        placeholder="Please enter a description"
        show-word-limit
      />

      <van-field
        name="uploader"
        label="picture"
      >
        <template #input>
          <van-uploader
            :before-read="beforeUploadRead"
            :after-read="afterUploadRead"
            v-model="fileList"
            :max-count="1"
          />
        </template>
      </van-field>

    </van-form>

  </div>
</template>

<script>
import { getDishessById, addDishes, updateDishes } from "@/api/dishes";
import { getCategorys } from "@/api/category";
import { uploadImage } from "@/api/base";
export default {
  name: "DishesCreate",
  data() {
    return {
      formData: {},
      categoryNames: [],
      categoryName: "",
      categoryItems: [],
      defaultIndex: 0,
      switchChecked: true,
      dishesID: 0,
      showPicker: false,
      fileList: [],
      imgFile: "",
      title: "",
    };
  },
  computed: {},
  created() {
    //获取菜品ID，存在为编辑
    let { id } = this.$route.query;
    if (id) {
      this.getData(id);
      this.dishesID = id;
      this.title = "Edit dishes";
    } else {
      this.title = "New dishesdishes";
      //加载分类列表
      this.getCategoryList();
    }
  },

  methods: {
    onCategoryConfirm(value) {
      let categoryData = this.categoryItems.find((item) => {
        return item.name === value;
      });
      this.categoryName = value;
      this.formData.cid = categoryData.id;
      this.showPicker = false;
    },
    beforeUploadRead(file) {
      if (file.type != "image/jpeg" && file.type != "image/png") {
        this.$toast("Please upload jpg or png Format picturemat picture");
        return false;
      }
      return true;
    },
    afterUploadRead(file) {
      this.imgFile = file;
    },
    async getData(id) {
      const { data } = await getDishessById(id);
      if (data.url) {
        this.fileList.push({ url: data.url });
      }
      this.formData = data;
      if (data.status == 0) {
        this.switchChecked = false;
      } else {
        this.switchChecked = true;
      }
      //加载分类列表
      this.getCategoryList();
    },
    async getCategoryList() {
      const { data } = await getCategorys();
      this.categoryItems = data;

      data.forEach((element) => {
        this.categoryNames.push(element.name);
      });

      if (this.formData.cid) {
        let categoryData = data.find((item) => {
          return item.id === this.formData.cid;
        });
        this.defaultIndex = this.categoryNames.indexOf(categoryData.name);
        this.categoryName = categoryData.name;
      }
    },
    async save() {
      if (this.imgFile) {
        let form = new FormData();
        form.append("file", this.imgFile.file);
        const { data } = await uploadImage(form);
        this.formData.url = "";
        this.formData.url = data.url;
      }
      if (this.switchChecked) {
        this.formData.status = 1;
      } else {
        this.formData.status = 0;
      }
      console.log("data: ", this.formData)
      if (this.dishesID == 0) {
        try {
          await addDishes(this.formData);
          this.$toast("Created successfully");
          this.$router.back(-1);
        } catch (error) {
          this.$toast("Creation failed" + error);
        }
      } else {
        try {
          this.formData.id = this.dishesID;
          await updateDishes(this.formData);
          this.$toast("update completed");
          this.$router.back(-1);
        } catch (error) {
          this.$toast("Update failed" + error);
        }
      }
    },
  },
};
</script>
<style lang="sass" scoped>
.van-form{margin-top: 46px}
</style>