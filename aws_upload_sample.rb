
require 'rubygems'
require 'aws-sdk'

# Instantiate a new client for Amazon Simple Storage Service (S3). With no
# parameters or configuration, the AWS SDK for Ruby will look for access keys
# and region in these environment variables:
#


s3 = AWS::S3.new(
  :access_key_id => 'REPLACE',
  :secret_access_key => 'REPLACE')

bucket_name = 'coursesatcudev' #changed to the newest bucket_name

bucket = s3.buckets[bucket_name] # no request made


files = Dir["/Users/timothychung/Desktop/files/*.pdf"]

files.each do |file|
  
  key = File.basename(file)
  object = bucket.objects[key]

  puts "Uploading #{file} as '#{key}' to '#{bucket_name}'"
  object.write(Pathname.new(file), :acl => :public_read) 
  puts object.public_url
  puts object.url_for(:read)
end


#!/usr/bin/env ruby

# Copyright 2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You
# may not use this file except in compliance with the License. A copy of
# the License is located at
#
#     http://aws.amazon.com/apache2.0/
#
# or in the "license" file accompanying this file. This file is
# distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
# ANY KIND, either express or implied. See the License for the specific
# language governing permissions and limitations under the License.







=begin

# Everything uploaded to Amazon S3 must belong to a bucket. These buckets are
# in the global namespace, and must have a unique name.
#
# For more information about bucket name restrictions, see:
# http://docs.aws.amazon.com/AmazonS3/latest/dev/BucketRestrictions.html


# Files in Amazon S3 are called "objects" and are stored in buckets. A specific
# object is referred to by its key (i.e., name) and holds data. Here, we create
# a new object with the key "ruby_sample_key.txt" and content "Hello World!".
#
# For more information on #create, see:
# http://docs.aws.amazon.com/AWSRubySDK/latest/AWS/S3/ObjectCollection.html#create-instance_method
object = bucket.objects.create('ruby_sample_key.txt', 'Hello World!')

# AWS::S3::S3Object#public_url generates an un-authenticated URL for the object.
# 
# See: http://docs.aws.amazon.com/AWSRubySDK/latest/AWS/S3/S3Object.html#public_url-instance_method
puts "Created an object in S3 at:"
puts object.public_url

# Generate a URL for downloading this object without using credentials or
# modifying the object's permissions. This is called a presigned URL.
# 
# See: http://docs.aws.amazon.com/AWSRubySDK/latest/AWS/S3/S3Object.html#url_for-instance_method
puts "\nUse this URL to download the file:"
puts object.url_for(:read)
=end

