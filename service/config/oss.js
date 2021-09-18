/**
 * aliyu oss
 * For image storage
 */
const OSS = require('ali-oss')
let client = new OSS({
    region: 'oss-cn-xxx',
    accessKeyId: 'xxx',
    accessKeySecret: 'xxx',
    bucket: 'xxx'
})

module.exports = client