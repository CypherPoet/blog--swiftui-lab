//
//  Dog.swift
//  ScrollViewPullToRefresh
//
//  Created by CypherPoet on 10/22/19.
// ✌️
//

import Foundation


struct Dog: Identifiable {
    let id = UUID()
    
    let name: String
    let picture: String
    let origin: String
    
    var description: String = ""
}


#if DEBUG

let sampleDogs = [
    Dog(name: "Airedale Terrier", picture: "airedale-terrier", origin: "United Kingdom", description: "The Airedale Terrier (often shortened to 'Airedale'), also called Bingley Terrier and Waterside Terrier, is a dog breed of the terrier type that originated in the valley (dale) of the River Aire, in the West Riding of Yorkshire, England.[1] It is traditionally called the 'King of Terriers' because it is the largest of the terrier breeds. The Airedale was bred from the Old English Black and Tan Terrier (now known as the Welsh Terrier), the Bull Terrier, the Otterhound and probably some other Terrier breeds, and has contributed to other dog breeds, such as the Yorkshire Terrier. Originally to serve as a versatile hunting and all around working farm dog, in Britain this breed has also been used as a war dog, guide dog and police dog. In the United States, this breed has been used to hunt big game, upland birds, and water fowl, and serve in many other working capacities."),
    Dog(name: "Alaskan Malamute", picture: "alaskan-malamute", origin: "Alaska", description: "Although it is believed that the first dogs arrived in the Americas 12,000 years ago, people and their dogs did not settle in the Arctic until the Paleo-Eskimo people 4,500 years ago, followed by the Thule people 1,000 years ago, with both originating from Siberia.[2] Malamutes were thought to be bred by the Malemiut Inupiaq people of Alaska's Norton Sound region"),
    Dog(name: "Basset Hound", picture: "basset-hound", origin: "France", description: "The Basset Hound is a short-legged breed of dog in the hound family. The Basset is a scent hound that was originally bred for the purpose of hunting hare. Their sense of smell and ability to ground-scent is second only to the Bloodhound.[1] Basset Hounds are one of six recognised 'basset'-type breeds in France. The name basset is derived from the French word bas, meaning 'low', with the attenuating suffix -et—together meaning 'rather low'. Basset Hounds are usually bicolours or tricolours of standard hound colouration."),
    Dog(name: "Dogo Argentino", picture: "dogo-argentino", origin: "Argentina", description: "The Dogo Argentino is a large, white, muscular breed of dog that was developed in Argentina primarily for the purpose of big-game hunting, including wild boar.[1][2] The breeder, Antonio Nores Martínez, also wanted a dog that would exhibit steadfast bravery and willingly protect its human companion. It was first bred in 1928 from the Cordoba Dog, along with a wide array of other breeds, including the Great Dane"),
    Dog(name: "Irish Setter", picture: "irish-setter", origin: "Ireland", description: "The Irish Setter (Irish: sotar rua,[1] literally 'red setter') is a setter, a breed of gundog, and family dog. The term Irish Setter is commonly used to encompass the show-bred dog recognised by the American Kennel Club as well as the field-bred Red Setter recognised by the Field Dog Stud Book."),
    Dog(name: "Samoyed Dog", picture: "samoyed", origin: "Northern Russia", description: "The Samoyed (/ˈsæməjɛd/ SAM-ə-yed or /səˈmɔɪ.ɛd/ sə-MOY-ed;[1] Russian: Самое́дская соба́ка or Самое́д) is a breed of large herding dog that descended from the Nenets herding laika, a spitz-type dog, with a thick, white, double-layer coat. It takes its name from the Samoyedic peoples of Siberia. These nomadic reindeer herders bred the fluffy white dogs to help with the herding. An alternative name for the breed, especially in Europe, is Bjelkier.")
]

#endif
