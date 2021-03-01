export function dateFormat(originVal) {
    const dt = new Date(originVal)

    const y = dt.getFullYear()
    const m = (dt.getMonth() + 1 + '').padStart(2, '0')
    const d = (dt.getDate() + '').padStart(2, '0')

    const hh = (dt.getHours() + '').padStart(2, '0')
    const mm = (dt.getMinutes() + '').padStart(2, '0')
    const ss = (dt.getSeconds() + '').padStart(2, '0')

    return `${y}-${m}-${d} ${hh}:${mm}:${ss}`
}

export function deepClone(obj) {
    var o;
    // 如果  他是对象object的话  , 因为null,object,array  也是'object';
    if (typeof obj === 'object') {

        // 如果  他是空的话
        if (obj === null) {
            o = null;
        } else {

            // 如果  他是数组arr的话
            if (obj instanceof Array) {
                o = [];
                for (var i = 0, len = obj.length; i < len; i++) {
                    o.push(deepClone(obj[i]));
                }
            }
            // 如果  他是对象object的话
            else {
                o = {};
                for (var j in obj) {
                    o[j] = deepClone(obj[j]);
                }
            }

        }
    } else {
        o = obj;
    }
    return o;
};