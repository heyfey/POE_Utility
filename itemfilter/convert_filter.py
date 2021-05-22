# Convert a NeverSink's filter to a quick-loot enabled filter.
import os

# ------settings-------------------------------------------------------------------------

# NeverSink's filters to convert
source_list = ["NeverSink's filter - 0-SOFT.filter",
               "NeverSink's filter - 1-REGULAR.filter",
               "NeverSink's filter - 2-SEMI-STRICT.filter",
               "NeverSink's filter - 3-STRICT.filter",
               "NeverSink's filter - 4-VERY-STRICT.filter",
               "NeverSink's filter - 5-UBER-STRICT.filter",
               "NeverSink's filter - 6-UBER-PLUS-STRICT.filter"]

target_suffix = "-quick-loot.filter"

loot_set = "    SetBorderColor 100 0 122 255 # for quick-loot\n"

loot_list = ["Class \"Maps\"", 
             "Sockets >= 6", "LinkedSockets 6",
             "Map Fragments",
             "StackSize", # include Simulacrum Splinters, Perandus Coin, 
             "Simulacrum Splinter",
             # Currency - Regular Currency Tiering
             "Exalted Orb", "Ancient Orb", "Blessing of Chayula", # t1exalted, t2divine
             "Exalted Shard", "Chaos Orb", "Abrasive Catalyst", # t3annul, t4chaos
             "Cartographer's Chisel", "Blessed Orb", # t5alchemy, t6chrom
             "Engineer's Orb", "Chaos Shard", "Alchemy Shard", # t7chance, t8trans
             "Fractured Fossil", "Faceted Fossil", "Aetheric Fossil", "Aberrant Fossil", # Fossil T1-T4
             "Delirium Orb",
             "Prime Regrading Lens", "Rogue's Marker",
             "Tainted Oil", "Golden Oil", "Black Oil", "Azure Oil", "Amber Oil", # Oil T1-T4
             "Deafening Essence of", "Remnant of Corruption", "Screaming Essence of", # Essence T1-T3
             "Splinter of Chayula", "Timeless Eternal Empire Splinter", "Splinter of Esh",
             "Class \"Incubator\"",
             "Deregulation Scroll", "Cartographer's Seal", # Others
             "Fated Connections", "A Dishonourable Death", "A Prodigious Hand", "A Master Seeks Help", # Prophecy T1-T3
             "Abandoned Wealth", "A Note in the Wind", "A Familiar Call", # Divination cards T1-T3
             "Boon of Justice", # Divination cards t4c
             "Metamorph",
             "Quality 20",
             "Prime Alchemical Resonator", "Potent Chaotic Resonator", "Potent Alchemical Resonator", # Resonators T1-T3
             "Contract", "Blueprint", "Heist Target" # Heist
             ] 
# --------------------------------------------------------------------------------------

info = "\
# >>> POE_Utility\n\
#\n\
#  >> This filter has been edited for quick-loot: currency, 6-Socket, maps, prophecy, divination cards, fossil\n\
#  >> For more details, Ctrl + F: SetBorderColor 100 0 122 255 # For quick-loot\n\
#  >> Get the latest version on: https://github.com/heyfey/POE_Utility\n\
#\n\
#===============================================================================================================\n"

# --------------------------------------------------------------------------------------

def convert():
    for source in source_list:
        target = os.path.splitext(source)[0] + target_suffix
        print("input filter:  " + source)
        print("output filter: " + target)

        try:
            f = open(source, "r")
        except:
            print(source + "not exist!")
            continue
        line = f.readline()
        flag = False

        t = open(target, "w")
        t.write(info)

        while line:
            if line == "\n":
                t.write(line)
                line = f.readline()
                continue
            
            first_word = line.split()[0]
            if first_word[0] == '#': # comment
                t.write(line)
            
            elif first_word == "Show" or first_word == "Hide": # block start
                flag = False
                t.write(line)

            elif loot_set.split()[0] in line and flag == True: # SetBorderColor
                pass
            
            else:
                if not flag:
                    for key in loot_list:
                        if key in line:
                            # print(line)
                            flag = True
                            break
                    t.write(line)
                    if flag:
                       t.write(loot_set)
                else:
                    t.write(line)

            line = f.readline()

        print("done")

if __name__ == '__main__':
    print("***POE_Utility: NeverSink's filter converter***")
    convert()