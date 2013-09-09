# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#SampleAppRails4Progress::Application.config.secret_key_base = '2b79647ba28a5b7c2214f69e188c707a211f473521704a572d2884d477ce9b472dce0d464e827049027eb7c6f04a73b89250da6b0339b7ae408c382df9144ce0'

def secure_token
  token_file = Rails.root.join('secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

SampleAppRails4Progress::Application.config.secret_key_base = secure_token
