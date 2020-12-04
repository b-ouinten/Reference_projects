
const firstNWords = (string, number=10) =>
{

    return string.split(' ').slice(0, number).join(' ')

}


export default firstNWords;