
const deepCloneObject = (object) => {
    let newObject = {};

    for (const key in object) {
        newObject[key] = typeof (object[key]) === "object" ? { ...object[key] } : object[key];
    }

    return newObject
}


export default deepCloneObject;
