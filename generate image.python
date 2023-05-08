import telegram
import numpy as np
import tensorflow as tf
from tensorflow.keras.models import load_model
from tensorflow.keras.preprocessing import image
from telegram.ext import Updater, CommandHandler, MessageHandler, Filters

# token API dari BotFather
TOKEN = 'masukan_token_api_bot_anda_disini'

# inisialisasi bot
bot = telegram.Bot(token=TOKEN)

# load model GAN yang telah di-train sebelumnya
model = load_model('model_gan.h5')

# fungsi untuk menghasilkan gambar anime
def generate_image(update, context):
    # mengambil gambar input dari pesan yang dikirimkan oleh pengguna
    file_id = update.message.photo[-1].file_id
    file = bot.get_file(file_id)
    file.download('input.jpg')

    # memproses gambar input menjadi array numpy
    img = image.load_img('input.jpg', target_size=(64, 64))
    x = image.img_to_array(img)
    x = np.expand_dims(x, axis=0)

    # menghasilkan gambar anime menggunakan model GAN
    generated_image = model.predict(x)[0]

    # menyimpan gambar hasil ke dalam file
    image.save_img('output.jpg', generated_image)

    # mengirimkan gambar hasil ke pengguna
    context.bot.send_photo(chat_id=update.effective_chat.id, photo=open('output.jpg', 'rb'))

# inisialisasi bot dan menambahkan handler untuk command /generate
updater = Updater(token=TOKEN, use_context=True)
updater.dispatcher.add_handler(CommandHandler('generate', generate_image))

# menjalankan bot
updater.start_polling()
updater.idle()
