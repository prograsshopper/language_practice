import Person, {makePerson} from './utils/makePerson'
import IPerson from './IPerson'

const testMakePerson = (): void => {
    let jane: IPerson = makePerson('Jane')
    let jack: IPerson = makePerson('Jack')
    console.log(jane, jack)
}

testMakePerson()