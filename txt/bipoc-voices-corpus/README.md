# Corpus of BIPOC Voices in the Victorian Periodical Press

**Page Authors** Adrian S. Wisnicki (University of Nebraska-Lincoln), with Dino Franco Felluga (Purdue University)

**Corpus Contributors:** Trevor Bleick (University of Nebraska-Lincoln), Thomas Coughlin (University of South Carolina), Kenneth C. Crowell (Auburn University), Dino Franco Felluga (Purdue University), Cassie Fletcher (University of Nebraska-Lincoln), Kayla Morgan (Purdue University), Kasey Peters (University of Nebraska-Lincoln), Malik Raymond (Purdue University), Jocelyn Spoor (University of Nebraska-Lincoln), Adrian S. Wisnicki (University of Nebraska-Lincoln)

**Date:** 2022

**Terms of use:**  [Creative Commons Attribution 4.0 International](https://creativecommons.org/licenses/by/4.0/)

**Cite page and corpus (MLA):** Adrian S. Wisnicki, Dino Franco Felluga, and Corpus Contributors. *Corpus of BIPOC Voices in the Victorian Periodical Press*. “BIPOC Voices,” *One More Voice*, solidarity edition; Collaborative Organization for Virtual Education (COVE); 2022. [https://github.com/livingstoneonline/onemorevoice/tree/master/txt/bipoc-voices-corpus](https://github.com/livingstoneonline/onemorevoice/tree/master/txt/bipoc-voices-corpus).

<br>

## Overview

The *Corpus of BIPOC Voices in the Victorian Periodical Press* brings together 64 short texts from Victorian periodicals and one related short book. The Corpus is an unexpected by-product of “[BIPOC Voices in the Victorian Periodical Press]( https://onemorevoice.org/html/bipoc-voices/bv-home.html)” (henceforth, “BIPOC Voices”), a 2021 and 2022 initiative by scholars and students from *[One More Voice]( https://onemorevoice.org/)* (OMV) and [COVE]( https://editions.covecollective.org/) in collaboration with [Special Collections, SOAS Library]( https://www.soas.ac.uk/research/library/special-collections) and [Adam Matthew Digital](https://www.amdigital.co.uk/) (AMD). This initiative sought to identify, document, encode, publish, and critically study a series of BIPOC voices from Victorian missionary periodicals. The initiative involved two branches of endeavor, one funded by the [University of Nebraska-Lincoln]( https://www.unl.edu/) (UNL) and centered on the physical print holdings of SOAS, the other funded by the [Research Society for Victorian Periodicals]( https://rs4vp.org/) (RSVP) and centered on the digital holdings of AMD. Both branches focused on missionary periodicals because such periodicals offer an excellent opportunity for engaging with a wide range of Victorian-era representations of BIPOC voices due to the global nature of missionary work.

As part of the “BIPOC Voices” project, a set of graduate students at the University of Nebraska-Lincoln, Purdue University, and elsewhere encoded the 64 pieces gathered in the present corpus in HTML; advanced scholars on the project then developed the files further. As that work came to a conclusion, it emerged that the files might easily be stripped of their HTML coding and presented alongside the other corpus already pubished by *One More Voice*, [Corpus of Africa-Centered Literary Works, 1830-1930](https://github.com/livingstoneonline/onemorevoice/tree/master/txt/africa-corpus). One of the “BIPOC Voices” Co-PIs Adrian S. Wisnicki, therefore, prepared the files for the corpus through a few simple steps: 
1. Strip out the HTML tags by using the following terminal command iteratively over all the files: `sed 's/<[^>]*>//g ; /^$/d' filename.html > filename.txt`
2. Manually remove a few stray bits of coding not caught by the terminal command;
3. Manually replace a few HTML-coded characters;
4. Strip out unnecessary white space and empty lines by adapting a [script](https://github.com/livingstoneonline/onemorevoice/blob/master/bash/del-meta%2BemptyLines%2BleadSpace.command) already developed for *One More Voice*; 
5. Switched the order of items in the files so that the metadata now comes before rather than after the main text of the periodical pieces;
6. Change citation information in file to point to Corpus.

To support use of the files, Wisnicki also created an [integrated spreadsheet](https://github.com/livingstoneonline/onemorevoice/tree/master/txt/africa-corpus/data/bipoc-voices-corpus-metadata.xlsx) that provides metadata for all the files in the corpus. This spreadsheet derives from spreadsheets created for the [SOAS](https://docs.google.com/spreadsheets/d/12IU93UjaspiELkYCr5rAwaqVm6HxxZtjC2dla3Nonkg/edit?usp=sharing) and [AMD](https://docs.google.com/spreadsheets/d/19oeF0brZEt7hFUTf8H4Ot22r2j4h_LFf2TDABC4cvEg/edit?usp=sharing) project files.

The corpus is now published, like most of *One More Voice*'s files, under a [Creative Commons Attribution 4.0 International](https://creativecommons.org/licenses/by/4.0/) (CC BY 4.0) license in order to promote wide educational use. In engaging with the corpus and its texts, users are urged to exercise caution due to the possible inclusion of offensive or otherwise problematic historical language. Users should also take note that any racist or similar elements in the texts do not necessarily represent the real views of the BIPOC creator(s), but rather may be due to the (often silent) intervention of Victorian-era white British missionaries, editors, and publishers. The [home page](https://onemorevoice.org/html/bipoc-voices/bv-home.html) of the “BIPOC Voices” project provides further context for the development of the corpus as well as access to the various critical materials produced by the “BIPOC Voices” project as a whole.

<br>

## List of Works

1. A.E. Moule, and Dziao. 1874. “Praying for Rain in China. Plain Directions as to Prayer for Rain.” *File name:* liv_026029.txt
2. Aga, Selim. 1853. *Africa Considered in Its Social and Political Condition with a Plan for the Amelioration of Its Inhabitants. By a Native of Darfour, Central Africa, and Originally a Slave*. *File name:* liv_025997.txt
3. Aga, Selim. 1874. “My Parentage and Early Career as a Slave.” *File name:* liv_025998.txt
4. Aga, Selim. 1875. “A Trip Up the Congo or Zaire River.” *File name:* liv_025999.txt
5. Anonymous, [John Cain], and A.S. 1874. “A Hindu’s Narrative of His Own Conversion.” *File name:* liv_026036.txt
6. Anonymous, [L. Nicholson], and Nathaniel Henry Boston. 1874. “Henry Boston, African Native Pastor.” *File name:* liv_026037.txt
7. Anonymous, [South African Missionary Society], Jan, and Karolus. 1804. “Letter of a Bastard Hottentot; Letter of Another Bastard Hottentot.” *File name:* liv_025087.txt
8. Anonymous, [Vaughan], and Anonymous. 1875. “‘Not Far From the Kingdom of God.’” *File name:* liv_026045.txt
9. Anonymous, [W. Clarkson], and Gungaram. 1852. “The Hindus.” *File name:* liv_026014.txt
10. Anonymous, [W.J. Davis], and James Lewana. 1872. “South Africa. Graham’s Town District.” *File name:* liv_025194.txt
11. Anonymous, Adam Kok, and Willem Uithaalder. 1851. “The Hottentot Rebellion.” *File name:* liv_025034.txt
12. Anonymous, and [Abdul] Meseeh. 1856. “Abdool Meseeh’s Hymn.” *File name:* liv_026009.txt
13. Anonymous, and Abdul Messeeh. 1875. “The First Native Clergyman in India.” *File name:* liv_026046.txt
14. Anonymous, and Anonymous. 1851. “The Amazons.” *File name:* liv_026005.txt
15. Anonymous, and Anonymous. 1852. “Indian Snake Catcher.” *File name:* liv_026012.txt
16. Anonymous, and Anonymous. 1874. “The Missionary Bee-Hive.” *File name:* liv_026040.txt
17. Anonymous, and D. Williams. 1875. “Gleanings from Recent Letters. How Collections Are Made at Abeokuta.” *File name:* liv_026052.txt
18. Anonymous, and Daniel Olubi. 1874. “Gleanings from Recent Letters. Baptism and Death of an Aged Yoruba Woman.” *File name:* liv_026033.txt
19. Anonymous, and Daniel Olubi. 1875. “Gleanings from Recent Letters. The Gospel Preached by a Captive Yoruba Girl.” *File name:* liv_026047.txt
20. Anonymous, and Diphukwe. 1878a. “Diphukwe’s Address.” *File name:* liv_025059.txt
21. Anonymous, and F.J. de Rozario. 1874. “Gleanings from Recent Letters. Preaching on a Tricycle.” *File name:* liv_026035.txt
22. Anonymous, and G. Krishnayya. 1875. “Gleanings from Recent Letters. A Hindu Clergyman and His Heathen Father.” *File name:* liv_026044.txt
23. Anonymous, and Henry Johnson. 1874. “A Negro Clergyman at Nazareth.” *File name:* liv_026042.txt
24. Anonymous, and Imaduddin. 1874. “The Rev. Imadudden, of Umritsur.” *File name:* liv_026028.txt
25. Anonymous, and Jacob Walker. 1874. “Jamaica—The Native Pastorate.” *File name:* liv_025049.txt
26. Anonymous, and Jagadishwar Bhattachargya. 1853. “Trials of Converts in India.” *File name:* liv_026024.txt
27. Anonymous, and James White. 1875. “Gleanings from Recent Letters. A Conversation with Yoruba Market Women.” *File name:* liv_026043.txt
28. Anonymous, and John Dennis Blonde. 1851. “The Outcast from China Brought Safely Home.” *File name:* liv_026011.txt
29. Anonymous, and John Devasagayam. 1853. “Obituary of Arokkia Nadan.” *File name:* liv_026023.txt
30. Anonymous, and John Huki. 1853. “The Native Institution at Waikato Heads, New Zealand.” *File name:* liv_026022.txt
31. Anonymous, and Thomas King. 1851. “Stedfast Faith—Mark X. 29, 30.” *File name:* liv_026008.txt
32. Anonymous, and Matiu Taupaki. 1874. “Gleanings from Recent Letters. Letter from a Maori Clergyman.” *File name:* liv_026034.txt
33. Anonymous, and Narain Rao. 1851. “A Converted Brahmin’s Account of Himself.” *File name:* liv_026006.txt
34. Anonymous, and Nathaniel M. Bull. 1874. “The ‘Gleaner’ in the Timneh Country.” *File name:* liv_026041.txt
35. Anonymous, and Nee Sima. 1876. “Letter from a Native Missionary.” *File name:* liv_025052.txt
36. Anonymous, and Ranavolmanjaka. 1877. “The Queen’s Proclamation.” *File name:* liv_025057.txt
37. Anonymous, and Robert N. Mashaba. 1904. “A Letter from Robert Mashaba.” *File name:* liv_025280.txt
38. Anonymous, and S[amuel] Crowther, Jr. 1854. “Confessions of an Idolater.” *File name:* liv_026027.txt
39. Anonymous, and Sadaraka. 1870. “South Seas.—Mangaia.” *File name:* liv_025038.txt
40. Anonymous, and T[homas] King. 1853. “Destructive Fire at Abbeokuta.” *File name:* liv_026025.txt
41. Anonymous, and Tamehana Te Rauparaha. 1852a. “Tamahana Te Rauparaha.” *File name:* liv_026018.txt
42. Anonymous, and Tamehana Te Rauparaha. 1852b. “Tamahana Te Rauparaha.” *File name:* liv_026019.txt
43. Anonymous, and Tamehana Te Rauparaha. 1852c. “Tamahana Te Rauparaha.” *File name:* liv_026020.txt
44. Anonymous, and Tamehana Te Rauparaha. 1852d. “Tamahana Te Rauparaha.” *File name:* liv_026021.txt
45. Anonymous, and Trudo Audato. 1852. “The Dahomians.” *File name:* liv_026017.txt
46. Anonymous, and Yonan. 1852. “Adult Sunday-Schools Among the Nestorians.” *File name:* liv_026016.txt
47. Anonymous, Charles Pamla, and Boyce Mama. 1872. “South Africa. Graham’s Town District.” *File name:* liv_025195.txt
48. Anonymous, Chenjee, Tooloosee, and Lutchmee. 1849. “India. Native Female Education.” *File name:* liv_025029.txt
49. Anonymous, David Taiwanga, and Reweti Maika. 1850. “New Zealand.” *File name:* liv_026001.txt
50. Anonymous, John Owen’s Reader, Henry Venn’s Reader, and George Burder’s Reader. 1826. “Combooconum.” *File name:* liv_025019.txt
51. Anonymous, Poonapun, and Authautchee. 1850. “The Autobiography of Poonapun [...]; Autobiography of Authautchee [...].”*File name:* liv_025032.txt
52. Anonymous, R. Taylor, Tamehana Te Rauparaha, and Matini Wiwi. 1851. “New-Zealand Chiefs in Committee Drawing Up a Reply to the Society’s Jubilee Letter.” *File name:* liv_026003.txt
53. Anonymous, Ranavolmanjaka, and Rainilaiarivony. 1875. “Royal Proclamation on Slavery.” *File name:* liv_025050.txt
54. Anonymous, Samuel Johnson, Samuel Cole, T.B. Wright, Samuel Pearce, and D. Williams. 1875. “Sick and Dying Christians in Yoruba.” *File name:* liv_026049.txt
55. Anonymous, W. Colenso, and Anonymous. 1851. “Karepa, of Te Hawera.” *File name:* liv_026007.txt
56. Anonymous, William Clapham’s Reader, William Cooper’s Reader, and Inverkeithing’s Reader. 1826. “East Indies. Combooconum.” *File name:* liv_025020.txt
57. J.M. Dwane. 1877. “South Africa. Graham’s Town District.” *File name:* liv_025241.txt
58. James White, and C.A. Gollmer. 1854. “‘What Have I to Do Any More with Idols?’” *File name:* liv_026026.txt
59. [John Philip], and Brownlee. 1822. “Caffres. Extract from a Letter from Mr Brownlee to John Philip.” *File name:* liv_025015.txt
60. [John] Philip, Edward Edwards, and Anonymous. 1823. “Africa. Character of Africaner.” *File name:* liv_025017.txt
61. [M.E.J.], and Henry Budd. 1874a. “Day-Spring in the Far West. Sketches of Mission Work in British North America.” *File name:* liv_026030.txt
62. [M.E.J.], and Henry Budd. 1874b. “Day-Spring in the Far West. Sketches of Mission Work in British North America.” *File name:* liv_026038.txt
63. Philip Chunder Doss, Elijah Mudul, Nudia Chund Doss, Boistom Doss, Abraham Buxy, Gonesh Chundroo, Boycontoo Chundro, Thomas Christian, William Buckey, and Timothy Christian. 1852. “Letter to the Committee from the Bereaved Flock of the Rev. J.J. Weitbrecht.” *File name:* liv_026015.txt
64. Sargent, and Anonymous. 1874. “The False and the True Vasanta Rayar: A Narrative of Religious Excitement in South India Ten Years Ago.” *File name:* liv_026032.txt