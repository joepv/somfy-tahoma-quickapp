# The official repository for the *Somfy TaHoma Switch* Quick App for Fibaro Home Center 3

## The Quick App supports the following device types:

| Device                  | Tested |
| ----------------------- | ------ |
| Roller shutter          | Yes    |
| Exterior screen         | Yes    |
| Screen                  | No     |
| Awning                  | Yes    |
| Pergola                 | No     |
| Garage door             | No     |
| Window                  | No     |
| Venetian blind          | Yes    |
| Exterior venetian blind | No     |

### Commands

The standard **open**, **close** and **level** commands are supported. **Automatically the Favorite Position button is mapped to the My button on the Somfy system.** How cool is that!

### Device status

Most Somfy devices are not capable of reporting their status. Devices that use the IO protocol are capable but at the moment this is not implemented in this Quick App. You need to be aware of this when creating scenes with the HC3. Maybe I will implement this in the future, but I can’t say when.

## Installation

### Prerequisites

Before you can integrate your Somfy devices into the Home Center 3 (HC3) you must meet the following prerequisites:

- You need a [TaHoma switch](https://www.somfy.nl/producten/1870595/tahoma-switch),
- Your Somfy devices needs to be **configured** and **connected** to the TaHoma switch via the [TaHoma app](https://www.somfy.nl/producten/smart-home-en-afstandbediening/tahoma-smart-home/tahoma-app),
- This Somfy TaHoma Quick App installed on your HC3.

### Quick App installation

1. **Start** your favorite browser and open your Home Center 3 dashboard by typing the correct URL for your HC3,
2. Go to **Settings** and **Devices**,
3. **Click** the blue **+** icon to add a new device,
4. In the **Add Device** dialog click on **Other Device**,
5. Choose **Upload File** and upload the `.fqa` file downloaded from the FIBARO Marketplace.
6. Additionally you can change the icon of the Quick App with the attached icon.

### Quick App configuration

1. Go to **Settings** and **Devices**,
2. **Expand** the imported **Tahoma Switch** device,
3. **Select** the **Variables** tab,
4. Fill in the **userid** and **userPassword** fields with the credentials you use to login the TaHoma app on your phone or tablet.
5. If you press the blue **Save** button the Quick App will be initialised, reads all devices from the TaHoma box and automatically creates child devices in your HC3.

## Documentation

You can read the full documentation of the *Somfy TaHoma Switch* Quick App at:  
[https://docs.joepverhaeg.nl/somfy/](https://docs.joepverhaeg.nl/somfy)

## Support

The Somfy API may change in the future and **I cannot provide any support or advice of any kind when you use my Quick App**. I made this Quick App in my spare time as a hobby and am publishing the Quick App for others to enjoy the integration in their smart homes too.

## Disclaimer

This Quick App has been written in such a way that it respects the Somfy API guidelines. Your use of the Somfy TaHoma switch Quick App is solely at your own risk. If your public IP address is blocked by the Somfy API servers, that is your own responsibility. If Somfy changes or stops offering the API that this Quick App uses, I will not be responsible for the failure of automations made with this Quick App.

## Notice of Non-Affiliation

I’m not affiliated, associated, authorized, endorsed by, or in any way officially connected with [FIBARO](https://www.fibaro.com) ([Benelux](https://fibarobenelux.com)), or any of its subsidiaries or its affiliates. All product and company names as well as related images are registered trademarks of their respective owners.