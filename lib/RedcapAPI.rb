require "RedcapAPI/version"
class RedcapAPI
  def initialize(token, url)
    @url = url
    @token = token
  end

  def get(record_id = nil)
    payload = {:token=>@token, :format=>"json", :content=>"record", :type => 'flat'}
    data = JSON.parse Mechanize.new.post(@url, payload).body
    if record_id
      data = data.select{|x| x['record_id'] == record_id.to_s}
    end
    data
  end
  
  def get_fields
    payload = {:token=>@token, :format=>"json", :content=>"metadata"}
    response = JSON.parse Mechanize.new.post(@url, payload).body
    if response
      response.collect {|r| r['field_name'] if r }
    end
  end
  
  def post(data)
    data = filter_data(data)
    data_string = data.to_json
    payload = {:token => @token, :format=> 'json', :content=>'record', :type => 'flat', :data => data_string}
    Mechanize.new.post(@url, payload).body      
  end
  
  def filter_data(data)
    data = [data] if data.class == Hash
    
    data = data.collect do |entry|
      entry.each do |k, v|
        if v.class == Date
          entry[k] = v.strftime('%F')
        end
      end
      
      if !(entry.keys.include? 'record_id' or entry.keys.include? :record_id) # new entry and no id listed
        entry['record_id'] = next_open_record_id
      end
      entry
    end
    
  end
  
  def next_open_record_id
    old_entries = self.get
    if old_entries.empty?
      '1'
    else
      max_entry = old_entries.max_by{|e| e['record_id'].to_i}['record_id']
      (max_entry.to_i + 1).to_s
    end
  end

