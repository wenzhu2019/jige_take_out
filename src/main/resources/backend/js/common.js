var web_prefix = '/backend'

function init (url) {
    const params = {
        page: this.page,
        pageSize: this.pageSize,
        name: this.input ? this.input : undefined
    }
    getCommentList(url).then(res => {
        if (String(res.code) === '1') {
            this.tableData = res.data.records || []
            this.counts = res.data.total
        }
    }).catch(err => {
        this.$message.error('请求出错了：' + err)
    })
}
function getCommentList (url) {
    return $axios({
        url: url,
        method: 'get',
        params
    })
}
function getCode (code) {
    /*封装码值获取的js TODO*/
     return $axios({
        url: `/Code/${code}`,
        method: 'get'
    });
}