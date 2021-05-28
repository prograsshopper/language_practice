import * as U from './makeRandom'
import IPerson from '../IPerson'

export default class Person implements IPerson {
    constructor(public name: string, public age: number = U.makePersonRandomNumber()){}
}

export const makePerson = (
    name: string,
    age:number = U.makePersonRandomNumber()) : IPerson => ({name, age})
